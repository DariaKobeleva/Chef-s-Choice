//
//  ProfileView.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 24.06.2024.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @EnvironmentObject private var welcomeViewVM: WelcomeViewViewModel
    @State private var profileImage: UIImage? = UIImage(named: "chef")
    @State private var showingImagePicker = false
    @State private var showingActionSheet = false
    @State private var imagePickerSourceType: UIImagePickerController.SourceType = .photoLibrary
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(uiImage: profileImage!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .shadow(radius: 5)
                    .opacity(showingImagePicker ? 0 : 1) // Плавное исчезновение при открытии ImagePicker
                    .animation(.easeInOut(duration: 0.3), value: showingImagePicker)
                Button(action: {
                    showingActionSheet = true
                }) {
                    Text("Change Profile Picture")
                        .foregroundColor(.gray)
                        .cornerRadius(10)
                }
                .padding()
                .actionSheet(isPresented: $showingActionSheet) {
                    ActionSheet(
                        title: Text("Select Photo"),
                        message: nil,
                        buttons: [
                            .default(Text("Camera")) {
                                imagePickerSourceType = .camera
                                showingImagePicker = true
                            },
                            .default(Text("Photo Library")) {
                                imagePickerSourceType = .photoLibrary
                                showingImagePicker = true
                            },
                            .cancel()
                        ]
                    )
                }
                
                Form {
                    Section(header: Text("User Information").font(.headline)) {
                        TextField("Enter your name", text: $welcomeViewVM.user.name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                }
                .cornerRadius(10)
                .padding(.horizontal)
                .frame(maxWidth: 400, maxHeight: 300)
                .transition(.opacity)
                .animation(.easeInOut(duration: 0.4), value: showingActionSheet)
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
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(isPresented: $showingImagePicker, image: $profileImage, sourceType: imagePickerSourceType)
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(WelcomeViewViewModel())
}
