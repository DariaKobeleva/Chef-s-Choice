//
//  MyRecipeViewViewModel.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 16.07.2024.
//

import SwiftUI
import RealmSwift

final class MyRecipesListViewViewModel: ObservableObject {
    private var realm: Realm
    private var notificationToken: NotificationToken?
    
    @Published var recipes: [MyRecipe] = []
    
    init() {
        realm = try! Realm()
        loadRecipes()
        observeRecipes()
    }
    
    deinit {
        notificationToken?.invalidate()
    }
    
    func loadRecipes() {
        let results = realm.objects(MyRecipe.self)
        self.recipes = Array(results)
    }
    
    func observeRecipes() {
        let results = realm.objects(MyRecipe.self)
        notificationToken = results.observe { [weak self] changes in
            switch changes {
            case .initial(let results):
                self?.recipes = Array(results)
            case .update(let results, _, _, _):
                self?.recipes = Array(results)
            case .error(let error):
                print("Error observing recipes: \(error.localizedDescription)")
            }
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
    }
    
    func deleteRecipe(at offsets: IndexSet) {
        do {
            try realm.write {
                offsets.forEach { index in
                    let recipe = recipes[index]
                    if let objectToDelete = realm.object(ofType: MyRecipe.self, forPrimaryKey: recipe.id) {
                        realm.delete(objectToDelete)
                    }
                }
            }
        } catch {
            print("Failed to delete recipe: \(error.localizedDescription)")
        }
    }
}
