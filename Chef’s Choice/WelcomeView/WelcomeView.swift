//
//  ContentView.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 03.06.2024.
//

import SwiftUI

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject private var welcomeViewVM: WelcomeViewViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color(red: 1.0, green: 0.83, blue: 0.65), Color(red: 0.99, green: 0.4, blue: 0.52)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 30) {
                VStack(spacing: 20) {
                    Image("cookbook")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .shadow(radius: 10)
                    
                    Text("Hi there!")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                }
                
                VStack(alignment: .center, spacing: 10) {
                    Text("What's your name?")
                        .font(.title2)
                        .foregroundColor(.white.opacity(0.8))
                    
                    TextField("Please enter your name", text: $welcomeViewVM.user.name)
                        .padding()
                        .background(.white.opacity(0.3))
                        .cornerRadius(20)
                        .multilineTextAlignment(.center)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(welcomeViewVM.user.name.isEmpty ? .gray : .white.opacity(0.8), lineWidth: 2)
                        )
                        .shadow(radius: 5)
                        .frame(minHeight: 50)
                }
                .padding(.horizontal, 20)
                
                Button(action: welcomeViewVM.login) {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(welcomeViewVM.user.name.isEmpty ? .gray.opacity(0.6) : .green)
                        .cornerRadius(20)
                        .shadow(radius: 5)
                        .scaleEffect(welcomeViewVM.user.name.isEmpty ? 1.0 : 1.1)
                        .animation(.easeInOut(duration: 0.3), value: welcomeViewVM.user.name.isEmpty)
                }
                .padding(.horizontal, 40)
                .disabled(welcomeViewVM.user.name.isEmpty)
            }
            .padding(.top, 60)
            .padding(.bottom, 40)
        }
    }
}

#Preview {
    WelcomeView()
        .environmentObject(WelcomeViewViewModel())
}
#Preview {
    WelcomeView()
        .environmentObject(WelcomeViewViewModel())
}
