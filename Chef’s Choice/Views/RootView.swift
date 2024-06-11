//
//  RootView.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 03.06.2024.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject private var welcomeViewVM: WelcomeViewViewModel
    
    var body: some View {
        Group {
            if welcomeViewVM.user.isLoggedIn {
                ContentView()
            } else {
                WelcomeView()
            }
        }
    }
}
