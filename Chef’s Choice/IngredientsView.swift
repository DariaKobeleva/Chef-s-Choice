//
//  IngredientsView.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 11.06.2024.
//

import SwiftUI

struct IngredientsView: View {
    @StateObject private var networkManager = NetworkManager()
    @State private var searchText = ""
    
    var filteredIngredients: [Ingredient] {
        if searchText.isEmpty {
            return networkManager.ingredients
        } else {
            return networkManager.ingredients.filter { $0.strIngredient.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        List(filteredIngredients) { ingredient in
            NavigationLink(destination: IngredientRecipesView(ingredient: ingredient.strIngredient)) {
                HStack {
                    if let imageURL = ingredient.imageURL {
                        CustomKFImageView(imageURL: imageURL)
                            .frame(width: 70, height: 70)
                    } else {
                        DefaultImageView()
                    }
                    
                    Text(ingredient.strIngredient)
                        .font(.title2)
                }
            }
        }
        .listStyle(.plain)
        .navigationTitle("Ingredients")
        .task {
            await networkManager.fetchIngredients()
        }
        .searchable(text: $searchText)
        
    }
}

#Preview {
    IngredientsView()
}
