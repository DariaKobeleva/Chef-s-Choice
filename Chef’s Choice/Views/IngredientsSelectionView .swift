//
//  IngredientsSelectionView .swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 11.07.2024.
//

import SwiftUI

struct IngredientsSelectionView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var networkManager = NetworkManager()
    @Binding var selectedIngredients: [String]
    @State private var checkedIngredients = Set<String>()
    
    var body: some View {
        NavigationView {
            List(networkManager.ingredients) { ingredient in
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
                    Spacer()
                    Button(action: {
                        toggleSelection(for: ingredient.strIngredient)
                    }) {
                        Image(systemName: checkedIngredients.contains(ingredient.strIngredient) ? "checkmark.square" : "square")
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Select Ingredients")
            .navigationBarItems(trailing: Button("Save") {
                selectedIngredients.append(contentsOf: checkedIngredients)
                presentationMode.wrappedValue.dismiss()
            })
            .task {
                await networkManager.fetchIngredients()
            }
        }
    }
    
    private func toggleSelection(for ingredient: String) {
        if checkedIngredients.contains(ingredient) {
            checkedIngredients.remove(ingredient)
        } else {
            checkedIngredients.insert(ingredient)
        }
    }
}

