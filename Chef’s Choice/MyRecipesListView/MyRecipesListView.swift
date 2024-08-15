//
//  MyRecipeView.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 25.06.2024.
//

import SwiftUI
import RealmSwift

struct MyRecipesListView: View {
    @StateObject private var myRecipeVM = MyRecipesListViewViewModel()
    @State private var isShowingAddRecipeView = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(myRecipeVM.recipes) { recipe in
                    NavigationLink(destination: MyRecipeDetailsView(recipe: recipe)) {
                        HStack {
                            if let imageData = recipe.imageData, let uiImage = UIImage(data: imageData) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 70, height: 70)
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                            } else {
                                Image("cookbook")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 70, height: 70)
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                            }
                            Text(recipe.name)
                        }
                    }
                }
                .onDelete(perform: myRecipeVM.deleteRecipe)
            }
            .navigationTitle("My Recipes")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        isShowingAddRecipeView.toggle()
                    }) {
                        Image(systemName: "plus")
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $isShowingAddRecipeView) {
                AddRecipeView(myRecipeVM: myRecipeVM, isShowingAddRecipeView: $isShowingAddRecipeView)
                    .presentationDetents([.large, .large])
            }
        }
    }
}


#Preview {
    MyRecipesListView()
}
