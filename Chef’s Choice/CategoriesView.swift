//
//  CategoriesView.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 03.06.2024.
//

import SwiftUI
import Kingfisher

struct CategoriesView: View {
    @StateObject private var networkManager = NetworkManager()
    
    private let adaptiveColumns = [GridItem(.adaptive(minimum: 170))]
    
    var body: some View {
      
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    ForEach(networkManager.categories) { category in
                        NavigationLink(destination: CategoriesRecipesView(categories: category.strCategory)) {
                            VStack {
                                if let imageURL = URL(string: category.strCategoryThumb) {
                                    KFImage(imageURL)
                                        .resizable()
                                        .clipped()
                                        .cornerRadius(30)
                                        .aspectRatio(contentMode: .fit)
                                } else {
                                    Image("defaultImage")
                                }
        
                                Text(category.strCategory)
                                    .multilineTextAlignment(.center)
                                    .font(.title2)
                                    .foregroundStyle(.black)
                                    
                            
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
