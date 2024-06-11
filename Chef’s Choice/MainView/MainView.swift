//
//  MainView.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 03.06.2024.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject private var welcomeViewVM: WelcomeViewViewModel
    @StateObject private var networkManager = NetworkManager()
    
    private let adaptiveColumns = [GridItem(.adaptive(minimum: 170))]
    
    var body: some View {
        NavigationView {
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
                                Text(category.strCategory)
                                    .font(.headline)
                                    .frame(width: 170)
                                    .multilineTextAlignment(.center)
                            }
                            Text(category.strCategory)
                                .font(.headline)
                                .frame(width: 170)
                                .multilineTextAlignment(.center)
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
    MainView()
        .environmentObject(WelcomeViewViewModel())
}
