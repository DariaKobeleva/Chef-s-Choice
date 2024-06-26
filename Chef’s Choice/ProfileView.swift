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
        VStack {
            Spacer()
            Image(systemName: "person.fill")
                .resizable()
                .frame(width: 200, height: 200)
                .aspectRatio(contentMode: .fit)
            List {
                VStack {
                    Text("\(welcomeViewVM.user.name)")
                        .font(.largeTitle)
                }
                .listStyle(.plain)
            }
            .padding()
            ButtonView(action: welcomeViewVM.logout, text: "Log Out", colorButton: .cyan, isDisabled: false)
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(WelcomeViewViewModel())
}
