//
//  RecipeView.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 20.06.2024.
//

import SwiftUI

struct RecipeView: View {
    @StateObject private var networkManager = NetworkManager()
    let recipe: Recipe
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                AsyncImage(url: URL(string: recipe.strMealThumb)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    Image("defaultImage")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                
                Text(recipe.strMeal)
                    .font(.largeTitle)
                
                    .fontWeight(.bold)
                
                if let category = recipe.strCategory {
                    Text("Category: \(category)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                if let area = recipe.strArea {
                    Text("Cuisine: \(area)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                if let instructions = recipe.strInstructions {
                    Text(instructions)
                        .font(.body)
                        .padding(.top, 5)
                       .fixedSize(horizontal: false, vertical: true)
                    
                }
                Spacer()
            }
            .padding()
        }
        .navigationTitle(recipe.strMeal)
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    RecipeView(recipe: Recipe(
        idMeal: "52772",
        strMeal: "Teriyaki Chicken Casserole",
        strMealThumb: "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg",
        strDrinkAlternate: nil,
        strCategory: "Chicken",
        strArea: "Japanese",
        strInstructions: "Preheat oven to 350° F...",
        strTags: "Meat,Casserole",
        strYoutube: "https://www.youtube.com/watch?v=4aZr5hZXP_s",
        strIngredient1: "soy sauce",
        strIngredient2: "water",
        strIngredient3: "brown sugar",
        strIngredient4: "ground ginger",
        strIngredient5: "minced garlic",
        strIngredient6: "cornstarch",
        strIngredient7: "chicken breasts",
        strIngredient8: "stir-fry vegetables",
        strIngredient9: "brown rice",
        strMeasure1: "1/2 cup",
        strMeasure2: "1/2 cup",
        strMeasure3: "1/4 cup",
        strMeasure4: "1/2 teaspoon",
        strMeasure5: "1/2 teaspoon",
        strMeasure6: "4 Tablespoons",
        strMeasure7: "2",
        strMeasure8: "1 (12 oz.)",
        strMeasure9: "3 cups"
    ))
}
