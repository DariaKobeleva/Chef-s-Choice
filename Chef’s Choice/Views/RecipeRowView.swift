//
//  RecipeRowView.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 15.08.2024.
//

import SwiftUI

struct RecipeRowView<Destination: View>: View {
    let imageName: String
    let title: String
    let description: String
    let destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            HStack(spacing: 20) {
                Image(imageName)
                    .resizable()
                    .frame(width: 100, height: 100)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(title)
                        .font(.title2)
                        .fontWeight(.bold)
                    Text(description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            .padding(.vertical, 10)
        }
    }
}
