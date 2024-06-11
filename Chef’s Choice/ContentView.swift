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
            CategoriesView()
                .tabItem {
                    Label("Categories", systemImage: "list.bullet.clipboard.fill")
                }
            IngredientsView()
                .tabItem {
                    Label("Ingredients", systemImage: "carrot")
                }
            CuisinesView()
                .tabItem {
                    Label("Cuisines", systemImage: "flag")
                }
        }
    }
}

#Preview {
    ContentView()
}
