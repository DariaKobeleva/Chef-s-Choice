//
//  RecipeView.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 25.06.2024.
//

import SwiftUI

struct RecipesView: View {
    var body: some View {
        NavigationStack {
            List {
                RecipeRowView(
                    imageName: "recipe-book",
                    title: "Categories",
                    description: "Browse through a variety of recipe categories tailored to your taste.",
                    destination: CategoriesView()
                )
                
                RecipeRowView(
                    imageName: "ingridients",
                    title: "Ingredients",
                    description: "Discover recipes based on the ingredients you have on hand.",
                    destination: IngredientsView()
                )
                
                RecipeRowView(
                    imageName: "globe",
                    title: "Cuisines",
                    description: "Explore global cuisines and bring international flavors to your kitchen.",
                    destination: CuisinesView()
                )
            }
            .navigationTitle("Recipes")
            .listStyle(.plain)
        }
    }
}

#Preview {
    RecipesView()
}
