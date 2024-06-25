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
            }
            .listStyle(.plain)
            .navigationTitle("Recipes")
        }
        
    }
}

#Preview {
    ContentView()
}
