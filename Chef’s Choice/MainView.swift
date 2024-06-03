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
        Text("Hello, \(welcomeViewVM.userName)")
    }
}

#Preview {
    MainView()
}
