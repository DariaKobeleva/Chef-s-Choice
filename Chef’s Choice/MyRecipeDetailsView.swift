//
//  MyRecipeDetailsView.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 21.07.2024.
//

import SwiftUI

struct MyRecipeDetailsView: View {
    let recipe: MyRecipe
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                if let imageData = recipe.imageData, let uiImage = UIImage(data: imageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, maxHeight: 300)
                } else {
                    Image("cookbook")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, maxHeight: 300)
                }
                
                Text(recipe.name)
                    .font(.largeTitle)
                    .padding(.top, 10)
                
                Text("Ingredients")
                    .font(.headline)
                    .padding(.top, 10)
                
                ForEach(recipe.ingredients, id: \.self) { ingredient in
                    Text("- \(ingredient)")
                }
                .padding(.leading, 10)
                
                Text("Instruction")
                    .font(.headline)
                    .padding(.top, 10)
                
                Text(recipe.instruction)
                    .padding(.top, 5)
            }
            .padding()
        }
        .navigationTitle(recipe.name)
    }
}


#Preview {
    let recipe = MyRecipe()
    recipe.name = "Name of the dish"
    recipe.ingredients.append(objectsIn: ["Ingredient 1", "Ingredient 2", "Ingredients3"])
    recipe.instruction = "This is an example of cooking instructions."
    return MyRecipeDetailsView(recipe: recipe)
}
