//
//  Cuisines.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 11.06.2024.
//

struct Cuisine: Codable, Identifiable, Hashable {
    let strArea: String
    
    var id: String { strArea }
}

struct CuisineResponse: Codable {
    let meals: [Cuisine]
}


