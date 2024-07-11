//
//  AddRecipesView.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 25.06.2024.
//

import SwiftUI

struct AddRecipeView: View {
    @Binding var myRecipes: [MyRecipe]
    @Binding var isShowingAddRecipeView: Bool
    @State private var name = ""
    @State private var ingredients = ""
    @State private var instruction = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Recipe Name")) {
                    TextField("Enter recipe name", text: $name)
                }
                
                Section(header: Text("Ingredients")) {
                    TextField("Enter ingredients", text: $ingredients)
                }
                
                Section(header: Text("Instruction")) {
                    TextField("Enter instruction", text: $instruction)
                }
                
            }
        }
        .navigationBarTitle("Add Recipe")
        .navigationBarItems(leading: Button("Cancel") {
            isShowingAddRecipeView = false
        }, trailing: Button("Save") {
            let newRecipe = MyRecipe(
                name: name,
                ingredients: ingredients.components(separatedBy: ","),
                instruction: instruction, imageURL: ""
            )
            myRecipes.append(newRecipe)
            isShowingAddRecipeView = false
        })
        
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    @State static var myRecipes: [MyRecipe] = []
    @State static var isShowingAddRecipeView = true
    
    static var previews: some View {
        AddRecipeView(myRecipes: $myRecipes, isShowingAddRecipeView: $isShowingAddRecipeView)
    }
}
