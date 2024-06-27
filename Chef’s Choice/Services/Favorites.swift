//
//  Favorites.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 27.06.2024.
//

import Foundation
import SwiftUI

final class Favorites: ObservableObject {
   @Published var favoriteRecipes: Set<String> = []
    
    private let key = "Favorites"
    
    init() {
        if let savedRecipes = UserDefaults.standard.object(forKey: key) as? [String] {
            favoriteRecipes = Set(savedRecipes)
        } else {
            favoriteRecipes = []
        }
    }
    
    func contains(_ recipe: Recipe) -> Bool {
        favoriteRecipes.contains(recipe.idMeal)
    }
    
    func add(_ recipe: Recipe) {
        favoriteRecipes.insert(recipe.idMeal)
        save()
    }
    
    func remove(_ recipe: Recipe) {
        favoriteRecipes.remove(recipe.idMeal)
        save()
    }
    
    func save() {
        UserDefaults.standard.set(Array(favoriteRecipes), forKey: key)
    }
}
