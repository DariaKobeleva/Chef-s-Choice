//
//  CategoriesView.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 03.06.2024.
//

import SwiftUI

struct CategoriesView: View {
    @StateObject private var networkManager = NetworkManager()
    
    private let adaptiveColumns = [GridItem(.adaptive(minimum: 170))]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    ForEach(networkManager.categories, id: \.self) { category in
                        VStack {
                            AsyncImage(url: URL(string: category.strCategoryThumb)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipped()
                            } placeholder: {
                                Image("defaultImage")
                            }
                            Text(category.strCategory)
                                .multilineTextAlignment(.center)
                                .font(.title2)
                        }
                    }
                }
            }
            .navigationTitle("Categories")
            .task {
                await networkManager.fetchCategories()
            }
        }
    }
}

#Preview {
    CategoriesView()
        .environmentObject(WelcomeViewViewModel())
}
