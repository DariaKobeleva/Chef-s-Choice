//
//  Favorites.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 27.06.2024.
//

import Foundation
import SwiftUI

final class Favorites: ObservableObject {
    @Published var favoriteRecipes: Set<Recipe> = []
    
    private let key = "Favorites"
    
    init() {
        if let savedRecipes = UserDefaults.standard.object(forKey: key) as? [Recipe] {
            favoriteRecipes = Set(savedRecipes)
        } else {
            favoriteRecipes = []
        }
    }
    
    func contains(_ recipe: Recipe) -> Bool {
        favoriteRecipes.contains(recipe)
    }
    
    func add(_ recipe: Recipe) {
        favoriteRecipes.insert(recipe)
        save()
    }
    
    func remove(_ recipe: Recipe) {
        favoriteRecipes.remove(recipe)
        save()
    }
    
    //TODO: Realm realisation
    func save() {
        
    }
}
