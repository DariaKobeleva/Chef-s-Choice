//
//  IngredientsView.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 11.06.2024.
//

import SwiftUI

struct IngredientsView: View {
    @StateObject private var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.ingredients) { ingredient in
                HStack {
                    if let imageURL = ingredient.imageURL {
                        AsyncImage(url: imageURL) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 70, height: 70)
                        } placeholder: {
                           Image("defaultImage")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 70, height: 70)
                        }
                    }
                    Text(ingredient.strIngredient)
                        .font(.title2)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Ingredients")
            .task {
                await networkManager.fetchIngredient()
            }
        }
    }
}

#Preview {
    IngredientsView()
}
