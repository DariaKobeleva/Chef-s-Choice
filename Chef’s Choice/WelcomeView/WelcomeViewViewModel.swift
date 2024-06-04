//
//  WelcomeViewViewModel.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 03.06.2024.
//

import SwiftUI

final class WelcomeViewViewModel: ObservableObject {
    @Published var user = User()
    
    private let storageManager = StorageManager.shared
    
    init(user: User = User()) {
        self.user = user
    }
    
    func login() {
        user.isLoggedIn.toggle()
        storageManager.save(user: user)
    }
    
    func logout() {
        user.name = ""
        user.isLoggedIn.toggle()
        storageManager.clear()
    }
}
