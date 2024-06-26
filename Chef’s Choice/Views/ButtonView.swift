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
        Button(action: action)  {
            Text(text)
                .fontWeight(.bold)
                .foregroundStyle(isDisabled ? .white.opacity(0.5) : .white)
        }
        .frame(width: 100, height: 50)
        .background(isDisabled ? .gray.opacity(0.6) : colorButton)
        .clipShape(.rect(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.gray, lineWidth: 2).opacity(0.6)
        )
        .disabled(isDisabled)
    }
}

#Preview {
    ButtonView(action: {}, text: "Button", colorButton: .pink, isDisabled: true)
}
