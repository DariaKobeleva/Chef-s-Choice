//
//  MyRecipeViewViewModel.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 16.07.2024.
//

import SwiftUI
import RealmSwift

class MyRecipeViewModel: ObservableObject {
    private var realm: Realm
    @Published var recipes: [MyRecipe] = []
    
    init() {
        realm = try! Realm()
        loadRecipes()
    }
    
    func loadRecipes() {
        DispatchQueue.main.async {
            let results = self.realm.objects(MyRecipe.self)
            self.recipes = Array(results)
        }
    }
    
    func addRecipe(name: String, ingredients: [String], instruction: String, imageData: Data?) {
        let newRecipe = MyRecipe()
        newRecipe.name = name
        newRecipe.ingredients.append(objectsIn: ingredients)
        newRecipe.instruction = instruction
        newRecipe.imageData = imageData
        
        try! realm.write {
            realm.add(newRecipe)
        }
        loadRecipes()
    }
    
    func deleteRecipe(at offsets: IndexSet) {
        do {
            try realm.write {
                offsets.forEach { index in
                    let recipe = recipes[index]
                    realm.delete(recipe)
                }
            }
            
            loadRecipes()
            
        } catch {
            print("Failed to delete recipe: \(error.localizedDescription)")
        }
    }
}

