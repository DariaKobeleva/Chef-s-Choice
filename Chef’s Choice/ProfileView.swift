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
    @State private var photosPickerItem: PhotosPickerItem?
    
    var body: some View {
        NavigationStack {
            PhotosPicker(selection: $photosPickerItem, matching: .images) {
                
                //TODO: !systemName: "person")!)
                
                Image(uiImage: profileImage ?? UIImage(resource: .catChef))
                    .resizable()
                    .frame(width: 200, height: 200)
                    .aspectRatio(contentMode: .fit)
                    .shadow(radius: 5)
                    .clipShape(Circle())
            }
            VStack {
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
        .onChange(of: photosPickerItem) { _, _ in
            Task {
                if let photosPickerItem,
                   let data = try? await photosPickerItem.loadTransferable(type: Data.self) {
                    if let image = UIImage(data: data) {
                        profileImage = image
                    }
                }
                photosPickerItem = nil
            }
        }
    }
}


#Preview {
    ProfileView()
        .environmentObject(WelcomeViewViewModel())
}
