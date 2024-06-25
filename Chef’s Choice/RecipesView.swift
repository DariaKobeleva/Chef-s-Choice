//
//  RecipeView.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 25.06.2024.
//

import SwiftUI

struct RecipesView: View {
    var body: some View {
        List {
            NavigationLink(destination: CategoriesView()) {
                Text("Categories")
            }
            NavigationLink(destination: IngredientsView()) {
                Text("Ingredients")
            }
            NavigationLink(destination: CuisinesView()) {
                Text("Cuisines")
            }
            .navigationTitle("Recipes")
        }
        .listStyle(.plain)
    }
}

#Preview {
    RecipesView()
}
