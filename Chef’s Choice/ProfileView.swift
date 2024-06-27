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
                    TextField("Enter your name", text: $welcomeViewVM.user.name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.vertical, 5)
                }
                .padding()
            }
            .navigationTitle("Chef \(welcomeViewVM.user.name)")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: welcomeViewVM.logout) {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                    }
                    
                }
            }
        }
    }
}


#Preview {
    ProfileView()
        .environmentObject(WelcomeViewViewModel())
}
