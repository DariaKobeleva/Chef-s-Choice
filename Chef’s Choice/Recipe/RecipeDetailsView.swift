//
//  RecipeDetailsView.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 20.06.2024.
//

import SwiftUI

struct RecipeDetailsView: View {
    @EnvironmentObject var networkManager: NetworkManager
    @EnvironmentObject var favorites: FavoritesStorageManager
    @State private var isFavorite: Bool = false
    @State private var recipe: Recipe?
    
    let recipeId: String
    
    var body: some View {
        ScrollView {
            if let recipe = recipe {
                VStack(alignment: .leading, spacing: 10) {
                    if let youtubeURL = recipe.strYoutube,
                       let imageURL = URL(string: recipe.strMealThumb) {
                        YTView(videoURL: youtubeURL, imageURL: imageURL)
                    } else {
                        DefaultImageView()
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
                        await loadRecipe()
                    }
            }
            
        }
    }
    
    private func loadRecipe() async {
        do {
            self.recipe = try await networkManager.fetchRecipeDetails(by: recipeId)
        } catch {
            print("Failed to load recipe details: \(error)")
        }
    }
}

#Preview {
    RecipeDetailsView(recipeId: "52794")
        .environmentObject(FavoritesStorageManager.shared)
        .environmentObject(NetworkManager())
}

