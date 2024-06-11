//
//  Meal.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 08.06.2024.
//

import Foundation

struct Meal: Codable, Identifiable, Hashable {
    let idMeal: String
    let strMeal: String
    let strMealThumb: String

    var id: String { idMeal }
}

struct MealResponse: Codable {
    let meals: [Meal]
}



