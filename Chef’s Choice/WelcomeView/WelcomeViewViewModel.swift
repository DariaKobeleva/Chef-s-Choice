//
//  WelcomeViewViewModel.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 03.06.2024.
//

import SwiftUI

final class WelcomeViewViewModel: ObservableObject {
    private var storageManager = StorageManager.shared
    
    @Published var user = User()
    var userName: String
    var isLoggedIn: Bool
    
    init() {
        let user = storageManager.loadUser()
        userName = user.name
        isLoggedIn = user.isLoggedIn
    }
    
    func login() {
        isLoggedIn.toggle()
        storageManager.saveUser(user: User(name: userName, isLoggedIn: true))
    }
    
    func logout() {
        userName = ""
        isLoggedIn.toggle()
        storageManager.deleteUser()
    }
}
