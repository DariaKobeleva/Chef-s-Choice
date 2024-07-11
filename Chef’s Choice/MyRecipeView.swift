//
//  MyRecipeView.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 25.06.2024.
//

import SwiftUI

struct MyRecipeView: View {
    @State private var isShowingAddRecipeView = false
    @State private var myRecipes: [MyRecipe] = []
    
    var body: some View {
        NavigationStack {
            List(myRecipes) { recipe in
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
                AddRecipeView(myRecipes: $myRecipes, isShowingAddRecipeView: $isShowingAddRecipeView)
                    .presentationDetents([.large, .large])
            }
        }
    }
}

#Preview {
    MyRecipeView()
}
