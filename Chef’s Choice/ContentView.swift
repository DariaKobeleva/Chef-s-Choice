//
//  ContentView.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 11.06.2024.
//

import SwiftUI

struct ContentView: View {    
    var body: some View {
        TabView {
            RecipesView()
                .tabItem {
                    Label("Recipes", systemImage: "fork.knife")
                }
            FavoriteRecipesView()
                .tabItem {
                    Label("Favorite", systemImage: "star")
                }
            MyRecipesListView()
                .tabItem {
                    Label("My Recipes", systemImage: "heart.text.square.fill")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(WelcomeViewViewModel())
        .environmentObject(FavoritesStorageManager.shared)
        .environmentObject(NetworkManager())
}
