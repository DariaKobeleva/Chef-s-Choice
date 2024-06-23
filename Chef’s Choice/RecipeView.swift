//
//  RecipeView.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 20.06.2024.
//

import SwiftUI

struct RecipeView: View {
    @StateObject private var networkManager = NetworkManager()
    let recipeId: String
    
    var body: some View {
        ScrollView {
            if let recipe = networkManager.selectedRecipe {
                VStack(alignment: .leading, spacing: 10) {
                    Divider()
                    
                    Text(recipe.strMeal)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    if let youtubeURL = recipe.strYoutube {
                        YTView(videoURL: youtubeURL)
                    } else {
                        AsyncImage(url: URL(string: recipe.strMealThumb)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        } placeholder: {
                            Image("defaultImage")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.horizontal, 20)
                        }
                    }
                    
                    
                    if let category = recipe.strCategory {
                        Text("Category: \(category)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    if let area = recipe.strArea {
                        Text("Cuisine: \(area)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    if let instructions = recipe.strInstructions {
                        Text(instructions)
                    }
                }
                .padding()
            } else {
                ProgressView()
                    .task {
                        await networkManager.fetchRecipeDetails(by: recipeId)
                    }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    RecipeView(recipeId: "52771")
}
