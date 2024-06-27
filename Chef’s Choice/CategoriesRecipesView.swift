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
                                .font(.title3)
                                .foregroundStyle(.black)
                                .padding(.horizontal, 5)
                                .frame(maxWidth: .infinity, alignment: .center)
                        }
                        .padding(.bottom, 10)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
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
