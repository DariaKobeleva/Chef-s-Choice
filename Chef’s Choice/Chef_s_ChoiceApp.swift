//
//  Chef_s_ChoiceApp.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 03.06.2024.
//

import SwiftUI

@main
struct Chef_s_ChoiceApp: App {
    @StateObject private var welcomeViewVM = WelcomeViewViewModel(
        user: StorageManager.shared.fetchUser()
    )
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .environmentObject(welcomeViewVM)
    }
}
