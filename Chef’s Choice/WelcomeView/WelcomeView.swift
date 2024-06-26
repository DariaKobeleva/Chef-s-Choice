//
//  ContentView.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 03.06.2024.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject private var welcomeViewVM: WelcomeViewViewModel

    var body: some View {
        VStack(spacing: 20) {
            Image("defaultImage")
            Text("Hi there!")
            Text("What's your name?")
            TextField("Please enter your name", text: $welcomeViewVM.user.name)
                .frame(minHeight: 50)
                .multilineTextAlignment(.center)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.gray, lineWidth: 2).opacity(0.6)
                )
            
            ButtonView(
                action: welcomeViewVM.login,
                text: "Continue",
                colorButton: .green,
                isDisabled: welcomeViewVM.user.name.isEmpty
            )
        }
        .padding(.horizontal, 40)
    }
}

#Preview {
    WelcomeView()
        .environmentObject(WelcomeViewViewModel())
}
