//
//  CuisinesRecipesView.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 19.06.2024.
//

import SwiftUI
import Kingfisher

struct CuisinesRecipesView: View {
    let cuisine: String
    
    @StateObject private var networkManager = NetworkManager()
    
    private let adaptiveColumns = [GridItem(.adaptive(minimum: 170))]
    var body: some View {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                    ForEach(networkManager.recipes, id: \.idMeal) { recipe in
                        NavigationLink(destination: RecipeDetailsView(recipeId: recipe.idMeal)) {
                            VStack {
                                if let imageURL = URL(string: recipe.strMealThumb) {
                                    CustomKFImageView(imageURL: imageURL)
                                } else {
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
