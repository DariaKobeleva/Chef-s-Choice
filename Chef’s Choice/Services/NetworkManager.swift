//
//  NetworkManager.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 08.06.2024.
//

import Foundation

class NetworkManager: ObservableObject {
    @Published var meals: [Meal] = []
    @Published var categories: [Category] = []

    func fetchMeals() async {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?s=chicken") else {
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let mealResponse = try? JSONDecoder().decode(MealResponse.self, from: data) {
                DispatchQueue.main.async { [unowned self] in
                    meals = mealResponse.meals
                }
            }
        } catch {
            print("Failed to fetch meals: \(error)")
        }
    }
    
    func fetchCategories() async {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/categories.php") else {
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let categoriesResponse = try? JSONDecoder().decode(CategoryResponse.self, from: data) {
                DispatchQueue.main.async { [unowned self] in
                    categories = categoriesResponse.categories
                }
            }
        } catch {
            print("Failed to fetch categories: \(error)")
        }
    }
}

