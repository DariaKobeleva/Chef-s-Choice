//
//  MyRecipe.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 30.06.2024.
//

import Foundation

struct MyRecipe: Identifiable {
    var id = UUID()
    
    let name: String
    let ingredients: [String]
    let instruction: String
    let imageURL: String
}

