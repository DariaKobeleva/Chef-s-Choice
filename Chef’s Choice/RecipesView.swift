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
                NavigationLink(destination: CategoriesView()) {
                    HStack(spacing: 20) {
                        Image("recipe-book")
                            .resizable()
                            .frame(width: 100, height: 100)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Categories")
                                .font(.title2)
                                .fontWeight(.bold)
                            Text("Explore different categories of recipes.")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.vertical, 10)
                }
                
                NavigationLink(destination: IngredientsView()) {
                    HStack(spacing: 20) {
                        Image("ingridients")
                            .resizable()
                            .frame(width: 100, height: 100)

                        VStack(alignment: .leading, spacing: 10) {
                            Text("Ingredients")
                                .font(.title2)
                                .fontWeight(.bold)
                            Text("Discover recipes based on the ingredients you have on hand.")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.vertical, 10)
                }
                
                NavigationLink(destination: CuisinesView()) {
                    HStack(spacing: 20) {
                        Image("globe")
                            .resizable()
                            .frame(width: 100, height: 100)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Cuisines")
                                .font(.title2)
                                .fontWeight(.bold)
                            Text("Explore global cuisines and bring international flavors to your kitchen.")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        .padding(.vertical, 10)
                    }
                }
                .navigationTitle("Recipes")
            }
            .listStyle(.plain)
        }
    }
}

#Preview {
    RecipesView()
}
