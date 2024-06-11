//
//  Ingredient.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 11.06.2024.
//

import Foundation

struct Ingredient: Codable, Identifiable, Hashable {
    let idIngredient: String
    let strIngredient: String

    var id: String { idIngredient }
    
    var imageURL: URL? {
            URL(string: "https://www.themealdb.com/images/ingredients/\(strIngredient).png")
        }
}

struct IngredientResponse: Codable {
    let meals: [Ingredient]
}
