//
//  ProfileView.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 24.06.2024.
//

import SwiftUI

struct ProfileView: View {
    @AppStorage("user") private var userData: Data?
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "person.fill")
                .resizable()
                .frame(width: 200, height: 200)
                .aspectRatio(contentMode: .fit)
            List {
                VStack {
                    if let userData = userData,
                       let user = try? JSONDecoder().decode(User.self, from: userData) {
                        Text("\(user.name)")
                            .font(.largeTitle)
                    } else {
                        Text("No user data available")
                    }
                    
                }
                .listStyle(.insetGrouped)
                
                // ButtonView(action: storageManager.clear, text: "Log Out", colorButton: .cyan)
            }
            .padding()
        }
    }
}

#Preview {
    ProfileView()
}
