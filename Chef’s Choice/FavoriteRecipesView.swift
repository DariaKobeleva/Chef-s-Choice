//
//  FavoriteRecipesView.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 25.06.2024.
//

import SwiftUI

struct FavoriteRecipesView: View {
    @EnvironmentObject var favorites: Favorites
    
    var body: some View {
        NavigationView {
            List(Array(favorites.favoriteRecipes), id: \.self) { recipeId in
                Text(recipeId)
            }
            .navigationBarTitle("Favorite Recipes")
        }
    }
}

#Preview {
    FavoriteRecipesView()
        .environmentObject(Favorites())
}
