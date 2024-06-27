//
//  IngredientsView.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 11.06.2024.
//

import SwiftUI

struct IngredientsView: View {
    @StateObject private var networkManager = NetworkManager()
    @EnvironmentObject var favorites: Favorites
    
    var body: some View {
        List(networkManager.ingredients) { ingredient in
            NavigationLink(destination: IngredientRecipesView(ingredient: ingredient.strIngredient)) {
                HStack {
                    if let imageURL = ingredient.imageURL {
                       CustomKFImageView(imageURL: imageURL)
                            .frame(width: 70, height: 70)
                    } else {
                        Image("defaultImage")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 70, height: 70)
                    }
                    Text(ingredient.strIngredient)
                        .font(.title2)
                }
            }
        }
        .listStyle(.plain)
        .navigationTitle("Ingredients")
        .task {
            await networkManager.fetchIngredient()
        }
    }
}

#Preview {
    IngredientsView()
}
