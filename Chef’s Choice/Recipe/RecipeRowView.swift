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
            .padding(.horizontal, 20)
            .padding(.vertical, 20)
            .background(
                LinearGradient(
                    gradient: Gradient(
                        colors: [
                            Color(red: 0.85, green: 0.92, blue: 1.0),
                            Color(red: 1.0, green: 0.85, blue: 0.9)
                        ]
                    ),
                    startPoint: .top,
                    endPoint: .bottom
                ).ignoresSafeArea()
            )
            .cornerRadius(20) 
            .shadow(radius: 5)
        }
    }
}
