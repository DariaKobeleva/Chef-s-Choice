//
//  IngredientRecipesView.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 19.06.2024.
//

import SwiftUI
import Kingfisher

struct IngredientRecipesView: View {
    let ingredient: String
    
    @StateObject private var networkManager = NetworkManager()
    
    private let adaptiveColumns = [GridItem(.adaptive(minimum: 170))]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                ForEach(networkManager.recipes, id: \.idMeal) { recipe in
                    NavigationLink(destination: RecipeView(recipeId: recipe.idMeal)) {
                        VStack {
                            if let imageURL = URL(string: recipe.strMealThumb) {
                                KFImage(imageURL)
                                    .resizable()
                                    .clipped()
                                    .cornerRadius(30)
                                    .aspectRatio(contentMode: .fit)
                                
                            }
                            else {
                                Image("defaultImage")
                                    .resizable()
                                .clipped()
                                .cornerRadius(30)
                                .aspectRatio(contentMode: .fit)
                            }
                            
                            Text(recipe.strMeal)
                                .multilineTextAlignment(.center)
                                .font(.title2)
                        }
                        
                    }
                }
            }
            .navigationTitle("\(ingredient)")
            .task {
                await networkManager.fetchRecipesByIngredient(ingredient)
            }
        }
    }
}



#Preview {
    IngredientRecipesView(ingredient: "Chicken")
}
