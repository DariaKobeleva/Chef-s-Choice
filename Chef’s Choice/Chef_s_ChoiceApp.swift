//
//  Chef_s_ChoiceApp.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 03.06.2024.
//

import SwiftUI

@main
struct Chef_s_ChoiceApp: App {
    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .environmentObject(WelcomeViewViewModel())
        }
    }
}
