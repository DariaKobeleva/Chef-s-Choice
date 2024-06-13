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
    @Published var cuisines: [Cuisine] = []
    @Published var ingredients: [Ingredient] = []
    
    func fetchData<T: Decodable>(
        urlString: String,
        responseType: T.Type,
        update: @escaping (T) -> Void
    ) async {
        guard let url = URL(string: urlString) else {
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode(responseType, from: data)
            DispatchQueue.main.async {
                update(decodedResponse)
            }
        } catch {
            print("Failed to fetch data: \(error)")
        }
    }
    
    func fetchCategories() async {
        await fetchData(
            urlString: "https://www.themealdb.com/api/json/v1/1/categories.php",
            responseType: CategoryResponse.self
        ) { [unowned self] response in
            categories = response.categories
        }
    }
    
    func fetchCuisines() async {
        await fetchData(
            urlString: "https://www.themealdb.com/api/json/v1/1/list.php?a=list",
            responseType: CuisineResponse.self
        ) { [unowned self] response in
            cuisines = response.meals
        }
    }
    
    func fetchIngredient() async {
        await fetchData(
            urlString: "https://www.themealdb.com/api/json/v1/1/list.php?i=list",
            responseType: IngredientResponse.self
        ) { [unowned self] response in
            ingredients = response.meals
        }
    }
}
