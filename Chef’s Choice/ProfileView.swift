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
    @State private var profileImage: UIImage?
    @State private var showingImagePicker = false
    @State private var showingActionSheet = false
    @State private var imagePickerSourceType: UIImagePickerController.SourceType = .photoLibrary
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(uiImage: profileImage ?? UIImage(named: "catChef")!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .shadow(radius: 5)
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                
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
                
                List {
                    TextField("Enter your name", text: $welcomeViewVM.user.name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.vertical, 5)
                }
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
