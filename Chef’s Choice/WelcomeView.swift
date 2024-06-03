//
//  ContentView.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 03.06.2024.
//

import SwiftUI

struct WelcomeView: View {
    @State private var name: String = ""
    
    var body: some View {
        VStack {
            Text("Hi there!")
            Text("What's your name?")
            TextField("Please enter your name", text: $name)
                .multilineTextAlignment(.center)
                .padding(.all, 48)
            Button(action: {}) {
                Text("Next")
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
            }
            .frame(width: 100, height: 40)
            .background(.blue.opacity(0.7))
            .clipShape(.rect(cornerRadius: 20))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.gray, lineWidth: 1)
            )
        }

        
    }
}

#Preview {
    WelcomeView()
}
