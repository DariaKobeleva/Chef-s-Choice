//
//  MainView.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 03.06.2024.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject private var welcomeViewVM: WelcomeViewViewModel
    
    private var data = Array(1...20)
    private let colors: [Color] = [.red, .green, .blue, .yellow, .purple]
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                    ForEach(data, id: \.self) { number in
                        ZStack {
                            Rectangle()
                                .frame(width: 170, height: 170)
                                .foregroundStyle(.gray)
                        }
                    }
                }
//                Text("Hello, \(welcomeViewVM.user.name)")
//                ButtonView(action: welcomeViewVM.logout, text: "Log out", colorButton: .blue)
            }
            .navigationTitle("Recipes")
        }
    }
}

#Preview {
    MainView()
        .environmentObject(WelcomeViewViewModel())
}
