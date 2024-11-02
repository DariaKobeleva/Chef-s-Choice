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
                    Text("Choose Profile Picture")
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
                Text("USER INFORMATION")
                    .bold()
                    .font(.title3)
                    .foregroundStyle(.blue).opacity(0.5)
                Divider()
                TextField("Enter your name", text: $welcomeViewVM.user.name)
                    .textFieldStyle(.roundedBorder)
                    .font(.title2)
                    .multilineTextAlignment(.leading)
                    .keyboardType(.default)
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
            Spacer()
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
