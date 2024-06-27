//
//  ProfileView.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 24.06.2024.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var welcomeViewVM: WelcomeViewViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .aspectRatio(contentMode: .fit)
                List {
                    VStack {
                        TextField(welcomeViewVM.user.name, text: $welcomeViewVM.user.name)
                    }
                    .listStyle(.plain)
                }
                .padding()
                ButtonView(action: welcomeViewVM.logout, text: "Log Out", colorButton: .gray.opacity(0.4), isDisabled: false)
            }
            .navigationTitle("Chef \(welcomeViewVM.user.name)")
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(WelcomeViewViewModel())
}
