//
//  CuisinesRecipesView.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 19.06.2024.
//

import SwiftUI

struct CuisinesRecipesView: View {
    let cuisine: String
    
    @StateObject private var networkManager = NetworkManager()
    
    private let adaptiveColumns = [GridItem(.adaptive(minimum: 170))]
    var body: some View {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                    ForEach(networkManager.recipes) { recipe in
                        NavigationLink(destination: RecipeView(recipeId: recipe.id)) {
                            VStack {
                                AsyncImage(url: URL(string: recipe.strMealThumb)) { image in
                                    image
                                        .resizable()
                                        .clipped()
                                        .cornerRadius(30)
                                        .aspectRatio(contentMode: .fit)
                                } placeholder: {
                                    Image("defaultImage")
                                }
                                Text(recipe.strMeal)
                                    .multilineTextAlignment(.center)
                                    .font(.title2)
                            }
                            
                        }
                    }
                }
                .navigationTitle("\(cuisine)")
                .task {
                    await networkManager.fetchRecipesByCuisines(cuisine)
                }
            
        }
    }
}

#Preview {
    CuisinesRecipesView(cuisine: "Italian")
}
