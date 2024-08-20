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
    
    @Published var recipes: Results<MyRecipe>
    
    init() {
        realm = try! Realm()
        recipes = realm.objects(MyRecipe.self)
        observeRecipes()
    }
    
    deinit {
        notificationToken?.invalidate()
        print("MyRecipesListViewViewModel deinit")
    }
    
    func observeRecipes() {
        notificationToken = recipes.observe { [weak self] changes in
            switch changes {
            case .initial(_):
                self?.objectWillChange.send()
            case .update(_, _, _, _):
                self?.objectWillChange.send()
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
                offsets.map { recipes[$0] }.forEach(realm.delete)
            }
        } catch {
            print("Failed to delete recipe: \(error.localizedDescription)")
        }
    }
}
