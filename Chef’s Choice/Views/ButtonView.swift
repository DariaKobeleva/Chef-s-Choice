//
//  ButtonView.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 04.06.2024.
//

import SwiftUI

struct ButtonView: View {
    let action: () -> Void
    let text: String
    let colorButton: Color
    var isDisabled: Bool
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .fontWeight(.bold)
                .foregroundColor(isDisabled ? .white.opacity(0.5) : .white)
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .background(
                    Group {
                        if isDisabled {
                            Color.gray.opacity(0.6)
                        } else {
                            LinearGradient(gradient: Gradient(colors: [colorButton.opacity(0.8), colorButton]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        }
                    }
                )
                .cornerRadius(15)
                .shadow(color: isDisabled ? .clear : colorButton.opacity(0.6), radius: 5, x: 3, y: 3)
        }
        .disabled(isDisabled)
        .padding(.horizontal)
    }
}

#Preview {
    ButtonView(action: {}, text: "Button", colorButton: .pink, isDisabled: false)
}
