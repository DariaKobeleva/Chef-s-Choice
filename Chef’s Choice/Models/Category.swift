//
//  Category.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 10.06.2024.
//

struct Category: Codable, Identifiable, Hashable {
    let idCategory: String
    let strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String
    
    var id: String { idCategory }
}

struct CategoryResponse: Codable {
    let categories: [Category]
}
