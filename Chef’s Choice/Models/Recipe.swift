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
    
    var id: String { idMeal }
}

struct RecipeResponse: Codable {
    let meals: [Recipe]
}
