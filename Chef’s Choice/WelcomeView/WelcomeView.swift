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
        VStack {
            Image("defaultImage")
            Text("Hi there!")
            Text("What's your name?")
            TextField("Please enter your name", text: $welcomeViewVM.user.name)
                .multilineTextAlignment(.center)
                .padding(.all, 48)
            
            ButtonView(
                action: welcomeViewVM.login,
                text: "Continue",
                colorButton: .green,
                isDisabled: welcomeViewVM.user.name.isEmpty
            )
        }
    }
}

#Preview {
    WelcomeView()
        .environmentObject(WelcomeViewViewModel())
}
