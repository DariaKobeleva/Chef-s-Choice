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
                    Image("defaultImage")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, maxHeight: 300)
                }
                
                Text(recipe.name)
                    .font(.largeTitle)
                    .padding(.top, 10)
                
                Text("Ингредиенты")
                    .font(.headline)
                    .padding(.top, 10)
                
                ForEach(recipe.ingredients, id: \.self) { ingredient in
                    Text("- \(ingredient)")
                }
                .padding(.leading, 10)
                
                Text("Инструкции")
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
    recipe.name = "Name"
    recipe.ingredients.append(objectsIn: ["Ингредиент 1", "Ингредиент 2", "Ингредиент 3"])
    recipe.instruction = "Это пример инструкции по приготовлению."
    return MyRecipeDetailsView(recipe: recipe)
}
