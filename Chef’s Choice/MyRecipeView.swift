//
//  MyRecipeView.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 25.06.2024.
//

import SwiftUI
import RealmSwift

struct MyRecipeView: View {
    @StateObject private var myRecipeVM = MyRecipeViewModel()
    @State private var isShowingAddRecipeView = false
    
    var body: some View {
        NavigationStack {
            List(myRecipeVM.recipes) { recipe in
                HStack{
                    if let imageData = recipe.imageData, let uiImage = UIImage(data: imageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 70, height: 70)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    } else {
                        Image("defaultImage")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 70, height: 70)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    }
                    Text(recipe.name)
                }
            }
            
            .navigationTitle("My Recipe")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        isShowingAddRecipeView.toggle()
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isShowingAddRecipeView) {
                AddRecipeView(myRecipeVM: myRecipeVM, isShowingAddRecipeView: $isShowingAddRecipeView)
                    .presentationDetents([.large, .large])
            }
        }
    }
    private func deleteRecipes(at offsets: IndexSet) {
        myRecipeVM.deleteRecipe(at: offsets)
    }
}

#Preview {
    MyRecipeView()
}
