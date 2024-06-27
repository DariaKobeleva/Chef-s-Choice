//
//  Favorites.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 27.06.2024.
//

import Foundation
import SwiftUI

final class FavoritesStorageManager: ObservableObject {
    @Published var favoriteRecipes: Set<Recipe> = []
    
    static let shared = FavoritesStorageManager()
    
    private let key = "Favorites"
    
    private init() {}
    
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
