//
//  RecipeView.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 20.06.2024.
//

import SwiftUI
import Kingfisher

struct RecipeView: View {
    @StateObject private var networkManager = NetworkManager()
    @State private var showImage = false

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
                        
                        if let imageURL = URL(string: recipe.strMealThumb) {
                            KFImage(imageURL)
                                .resizable()
                                .clipped()
                                .cornerRadius(30)
                                .aspectRatio(contentMode: .fit)
                        } else {
                            Image("defaultImage")
                                .resizable()
                                .clipped()
                                .cornerRadius(30)
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                    
                    if let category = recipe.strCategory {
                        Text("Category: \(category)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .padding(.top, 10)
                    }
                    
                    if let area = recipe.strArea {
                        Text("Cuisine: \(area)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    Text("Ingredients")
                        .font(.title2)
                        .padding(.top, 10)
                    
                    ForEach(
                        Array(zip(recipe.ingredients, recipe.measures)).indices,
                        id: \.self
                    ){ index in
                        let ingredient = recipe.ingredients[index]
                        let measure = recipe.measures[index]
                        Text("\(ingredient): \(measure)")
                    }
                    
                    Text("Instructions")
                        .font(.title2)
                        .padding(.top, 10)
                    
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
    RecipeView(recipeId: "52772")
}
