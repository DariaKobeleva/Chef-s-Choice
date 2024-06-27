//
//  RecipeDetailsView.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 20.06.2024.
//

import SwiftUI

struct RecipeDetailsView: View {
    @StateObject private var networkManager = NetworkManager()
    @State private var isFavorite: Bool = false
    @EnvironmentObject var favorites: Favorites
    
    let recipeId: String
    
    var body: some View {
        ScrollView {
            if let recipe = networkManager.selectedRecipe {
                VStack(alignment: .leading, spacing: 10) {
                    if let youtubeURL = recipe.strYoutube,
                       let imageURL = URL(string: recipe.strMealThumb) {
                        YTView(videoURL: youtubeURL, imageURL: imageURL)
                    } else {
                        Image("defaultImage")
                            .resizable()
                            .clipped()
                            .cornerRadius(30)
                            .aspectRatio(contentMode: .fit)
                    }
                    
                    Text(recipe.strMeal)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
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
                    
                    Divider()
                    
                    Text("Ingredients")
                        .font(.title2)
                        .padding(.top, 10)
                    
                    ForEach(recipe.ingredientsAndMeasures.indices, id: \.self) { index in
                        let ingredient = recipe.ingredientsAndMeasures[index].0
                        let measure = recipe.ingredientsAndMeasures[index].1
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
                .navigationTitle(recipe.strCategory ?? recipe.strMeal)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            if favorites.contains(recipe) {
                                favorites.remove(recipe)
                            } else {
                                favorites.add(recipe)
                            }
                        }) {
                            Image(systemName: favorites.contains(recipe) ? "star.fill" : "star")
                                .foregroundColor(favorites.contains(recipe) ? .yellow : .gray)
                        }
                    }
                }
                
            } else {
                ProgressView()
                    .task {
                        await networkManager.fetchRecipeDetails(by: recipeId)
                    }
            }
            
        }
    }
}



#Preview {
    RecipeDetailsView(recipeId: "52794")
        .environmentObject(Favorites())
}
