//
//  MainView.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 03.06.2024.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject private var welcomeViewVM: WelcomeViewViewModel
    var body: some View {
        Text("Hello, \(welcomeViewVM.user.name)")
        ButtonView(action: welcomeViewVM.logout, text: "Log out", colorButton: .blue)
    }
}

#Preview {
    MainView()
        .environmentObject(WelcomeViewViewModel())
}
