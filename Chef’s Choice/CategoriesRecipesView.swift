//
//  CategoriesRecipesView.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 19.06.2024.
//

import SwiftUI

struct CategoriesRecipesView: View {
    let categories: String
    
    @StateObject private var networkManager = NetworkManager()
    
    private let adaptiveColumns = [GridItem(.adaptive(minimum: 170))]
    var body: some View {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                    ForEach(networkManager.recipes) { recipe in
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
            .navigationTitle("\(categories)")
            .task {
                await networkManager.fetchRecipesByCategories(categories)
            }
    }
}

#Preview {
    CategoriesRecipesView(categories: "Beef")
}
