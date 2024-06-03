//
//  StorageManager.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 03.06.2024.
//
import SwiftUI

final class StorageManager: ObservableObject {
    static let shared = StorageManager()
    
    @AppStorage("name") var userName = ""
    @AppStorage("isLoggedIn") var isLoggedIn = false
    
    private init() {}
    
    func saveUser(user: User) {
        userName = user.name
        isLoggedIn = user.isLoggedIn
    }
    
    func loadUser() -> User {
        User(name: userName, isLoggedIn: isLoggedIn)
    }
    
    func deleteUser() {
        UserDefaults.standard.removeObject(forKey: "name")
        UserDefaults.standard.removeObject(forKey: "isLoggedIn")
    }
}
