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
    
    var body: some View {
        Button(action: action)  {
            Text(text)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .frame(width: 100, height: 50)
        .background(colorButton)
        .clipShape(.rect(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 2).opacity(0.6)
        )
    }
}
