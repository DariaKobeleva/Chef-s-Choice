//
//  Recipe.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 19.06.2024.
//

import Foundation

struct Recipe: Codable, Identifiable {
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
    let strDrinkAlternate: String?
    let strCategory: String?
    let strArea: String?
    let strInstructions: String?
    let strTags: String?
    let strYoutube: String?
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    
    var id: String { idMeal }
}

struct RecipeResponse: Codable {
    let meals: [Recipe]
}

