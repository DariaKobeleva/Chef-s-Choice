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
    @Published var recipes: Results<MyRecipe>
    
    init() {
        realm = try! Realm()
        recipes = realm.objects(MyRecipe.self)
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
    }
    
    func deleteRecipe(at offsets: IndexSet) {
        offsets.forEach { index in
            let recipe = recipes[index]
            try! realm.write {
                realm.delete(recipe)
            }
        }
    }
}

