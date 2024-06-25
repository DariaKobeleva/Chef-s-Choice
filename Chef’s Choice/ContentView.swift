//
//  ContentView.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 11.06.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView {
                RecipesView()
                    .tabItem {
                        Label("Recipes", systemImage: "fork.knife")
                    }
                    FavoriteRecipesView()
                    .tabItem {
                        Label("Favorite", systemImage: "star")
                    }
                AddRecipesView()
                    .tabItem {
                        Label("My Recipe", systemImage: "heart.text.square.fill")
                    }
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person")
                    }
            }
            //.navigationTitle("Recipes")
        }
        
    }
}

#Preview {
    ContentView()
}
