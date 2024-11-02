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
                .foregroundStyle(.white.opacity(isDisabled ? 0.5 : 1))
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
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
                .shadow(color: colorButton.opacity(isDisabled ? 0 : 0.6), radius: 5, x: 3, y: 3)
        }
        .disabled(isDisabled)
        .padding(.horizontal)
    }
}

#Preview {
    ButtonView(action: {}, text: "Button", colorButton: .pink, isDisabled: false)
}
