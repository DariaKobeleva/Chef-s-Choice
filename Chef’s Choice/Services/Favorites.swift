//
//  Favorites.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 27.06.2024.
//

import Foundation
import SwiftUI

@Observable
final class Favorites {
    private var recipes: Set<String>
    
    private let key = "Favorites"
    
    init() {
        if let savedRecipes = UserDefaults.standard.object(forKey: key) as? [String] {
            recipes = Set(savedRecipes)
        } else {
            recipes = []
        }
    }
    
    func contains(_ recipe: Recipe) -> Bool {
        recipes.contains(recipe.idMeal)
    }
    
    func add(_ recipe: Recipe) {
        recipes.insert(recipe.idMeal)
        save()
    }
    
    func remove(_ recipe: Recipe) {
        recipes.remove(recipe.idMeal)
        save()
    }
    
    func save() {
        UserDefaults.standard.set(Array(recipes), forKey: key)
    }
}
