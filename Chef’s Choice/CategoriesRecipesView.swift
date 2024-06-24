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
                    NavigationLink(destination: RecipeView(recipeId: recipe.id)) {
                        VStack {
                            AsyncImage(url: URL(string: recipe.strMealThumb)) { image in
                                image
                                    .resizable()
                                    .clipped()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 200, maxHeight: 200)
                            } placeholder: {
                                Image("defaultImage")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: .infinity, maxHeight: 200)
                            }
                            Text(recipe.strMeal)
                                .multilineTextAlignment(.center)
                                .font(.title3)
                                .foregroundStyle(.white)
                                .padding(.horizontal, 5)
                                .frame(maxWidth: .infinity, alignment: .center)
                        }
                        .padding(.bottom, 10)
                        .background(.cyan)
                        .cornerRadius(15)
                        .shadow(radius: 10)
                        
                    }
                }
            }
            .padding()
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
