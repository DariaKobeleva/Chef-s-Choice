//
//  IngredientRecipesView.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 19.06.2024.
//

import SwiftUI

struct IngredientRecipesView: View {
    @EnvironmentObject var networkManager: NetworkManager
    let ingredient: String

    private let adaptiveColumns = [GridItem(.adaptive(minimum: 170))]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                ForEach(networkManager.recipes, id: \.idMeal) { recipe in
                    NavigationLink(destination: RecipeDetailsView(recipeId: recipe.idMeal)) {
                        VStack {
                            if let imageURL = URL(string: recipe.strMealThumb) {
                                CustomKFImageView(imageURL: imageURL)
                            }
                            else {
                                DefaultImageView()
                            }
                            
                            Text(recipe.strMeal)
                                .multilineTextAlignment(.center)
                                .font(.title2)
                                .frame(height: 20)
                        }
                    }
                }
            }
            .navigationTitle("\(ingredient)")
            .task {
                await networkManager.fetchRecipesByIngredient(ingredient)
            }
        }
        .padding()
    }
}



#Preview {
    IngredientRecipesView(ingredient: "Chicken")
        .environmentObject(NetworkManager())
}


