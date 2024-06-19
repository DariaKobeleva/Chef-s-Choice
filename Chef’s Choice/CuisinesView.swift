//
//  CuisinesView.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 11.06.2024.
//

import SwiftUI

struct CuisinesView: View {
    @StateObject private var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.cuisines) { cuisine in
                NavigationLink(destination: CuisinesRecipesView(cuisine: cuisine.strArea)) {
                    
                    Text(cuisine.strArea)
                        .font(.title2)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Cuisines")
            .task {
                await networkManager.fetchCuisines()
            }
        }
    }
}

#Preview {
    CuisinesView()
}
