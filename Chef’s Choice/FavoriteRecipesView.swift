//
//  FavoriteRecipesView.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 25.06.2024.
//

import SwiftUI

struct FavoriteRecipesView: View {
    @EnvironmentObject var favorites: FavoritesStorageManager
    private let adaptiveColumns = [GridItem(.adaptive(minimum: 170))]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                    ForEach(Array(favorites.favoriteRecipes), id: \.idMeal) { recipe in
                        NavigationLink(destination: RecipeDetailsView(recipeId: recipe.idMeal)) {
                            VStack {
                                if let imageURL = URL(string: recipe.strMealThumb) {
                                    CustomKFImageView(imageURL: imageURL)
                                } else {
                                    Image("defaultImage")
                                }
                                
                                Text(recipe.strMeal)
                                    .multilineTextAlignment(.center)
                                    .font(.title3)
                                    .foregroundStyle(.black)
                                    .padding(.horizontal, 5)
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                            .padding(.bottom, 10)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Favorite Recipes")
        }
        
    }
}






#Preview {
    FavoriteRecipesView()
        .environmentObject(FavoritesStorageManager.shared)
}
