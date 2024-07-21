//
//  AddRecipesView.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 25.06.2024.
//

import SwiftUI

struct AddRecipeView: View {
    @ObservedObject var myRecipeVM: MyRecipesListViewViewModel

    @Binding var isShowingAddRecipeView: Bool
    @State private var name = ""
    @State private var ingredients: [String] = []
    @State private var newIngredient = ""
    @State private var instruction = ""
    @State private var mealImage: UIImage?
    @State private var showingActionSheet = false
    @State private var showingImagePicker = false
    @State private var imagePickerSourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var showingIngredientsSelection = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Meal Image")) {
                    HStack {
                        Spacer()
                        Image(uiImage: mealImage ?? UIImage(named: "defaultImage")!)
                            .resizable()
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                            .shadow(radius: 5)
                        Spacer()
                    }
                    
                    Button(action: {
                        showingActionSheet = true
                    }) {
                        Text("Choose a photo")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .actionSheet(isPresented: $showingActionSheet) {
                        ActionSheet(
                            title: Text("Select Photo"),
                            message: nil,
                            buttons: [
                                .default(Text("Camera")) {
                                    imagePickerSourceType = .camera
                                    showingImagePicker = true
                                },
                                .default(Text("Photo Library")) {
                                    imagePickerSourceType = .photoLibrary
                                    showingImagePicker = true
                                },
                                .cancel()
                            ]
                        )
                    }
                }
                
                Section(header: Text("Recipe Name")) {
                    TextField("Enter recipe name", text: $name)
                }
                
                Section(header: Text("Ingredients")) {
                    VStack {
                        Button(action: {
                            showingIngredientsSelection = true
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.blue)
                        }
                        
                        List {
                            ForEach(ingredients, id: \.self) { ingredient in
                                Text(ingredient)
                                    .frame(alignment: .leading)
                                           }
                            .onDelete(perform: removeIngredient)
                        }
                    }
                }
                
                Section(header: Text("Instruction")) {
                    TextEditor(text: $instruction)
                        .frame(height: 200)
                }
            }
            .navigationBarTitle("Add Recipe", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel") {
                isShowingAddRecipeView = false
            }, trailing: Button("Save") {
                let ingredientsArray = ingredients.map { $0.trimmingCharacters(in: .whitespaces) }
                let imageData = mealImage?.jpegData(compressionQuality: 1.0)
                myRecipeVM.addRecipe(name: name, ingredients: ingredientsArray, instruction: instruction, imageData: imageData)
                isShowingAddRecipeView = false
            })
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(isPresented: $showingImagePicker, image: $mealImage, sourceType: imagePickerSourceType)
        }
        .sheet(isPresented: $showingIngredientsSelection) {
            IngredientsSelectionView(selectedIngredients: $ingredients)
        }
    }
    
    private func addIngredient() {
        let trimmedIngredient = newIngredient.trimmingCharacters(in: .whitespaces)
        guard !trimmedIngredient.isEmpty else { return }
        ingredients.append(trimmedIngredient)
        newIngredient = ""
    }
    
    private func removeIngredient(at offsets: IndexSet) {
        ingredients.remove(atOffsets: offsets)
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    @StateObject static var myRecipe = MyRecipesListViewViewModel()
    @State static var isShowingAddRecipeView = true
    
    static var previews: some View {
        AddRecipeView(myRecipeVM: myRecipe, isShowingAddRecipeView: $isShowingAddRecipeView)
    }
}
