//
//  NetworkManager.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 08.06.2024.
//

import Foundation

@MainActor
final class NetworkManager: ObservableObject {
    @Published var categories: [Category] = []
    @Published var cuisines: [Cuisine] = []
    @Published var ingredients: [Ingredient] = []
    @Published var recipes: [Recipe] = []
    @Published var videoID: String?
    
    private let baseUrl = "https://www.themealdb.com/api/json/v1/1/"
    
    private func fetchData<T: Decodable>(
        urlString: String,
        responseType: T.Type
    ) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(responseType, from: data)
    }
    
    func fetchCategories() async {
        do {
            let response: CategoryResponse = try await fetchData(urlString: "\(baseUrl)categories.php", responseType: CategoryResponse.self)
            self.categories = response.categories
        } catch {
            print("Failed to fetch categories: \(error)")
        }
    }
    
    func fetchCuisines() async {
        do {
            let response: CuisineResponse = try await fetchData(urlString: "\(baseUrl)list.php?a=list", responseType: CuisineResponse.self)
            self.cuisines = response.meals
        } catch {
            print("Failed to fetch cuisines: \(error)")
        }
    }
    
    func fetchIngredients() async {
        do {
            let response: IngredientResponse = try await fetchData(urlString: "\(baseUrl)list.php?i=list", responseType: IngredientResponse.self)
            self.ingredients = response.meals
        } catch {
            print("Failed to fetch ingredients: \(error)")
        }
    }
    
    func fetchRecipesByCategory(_ category: String) async {
        do {
            let response: RecipeResponse = try await fetchData(urlString: "\(baseUrl)filter.php?c=\(category)", responseType: RecipeResponse.self)
            self.recipes = response.meals
        } catch {
            print("Failed to fetch recipes by category: \(error)")
        }
    }
    
    func fetchRecipesByCuisine(_ cuisine: String) async {
        do {
            let response: RecipeResponse = try await fetchData(urlString: "\(baseUrl)filter.php?a=\(cuisine)", responseType: RecipeResponse.self)
            self.recipes = response.meals
        } catch {
            print("Failed to fetch recipes by cuisine: \(error)")
        }
    }
    
    func fetchRecipesByIngredient(_ ingredient: String) async {
        do {
            let response: RecipeResponse = try await fetchData(urlString: "\(baseUrl)filter.php?i=\(ingredient)", responseType: RecipeResponse.self)
            self.recipes = response.meals
        } catch {
            print("Failed to fetch recipes by ingredient: \(error)")
        }
    }
    
    func fetchRecipeDetails(by id: String) async throws -> Recipe? {
        let urlString = "\(baseUrl)lookup.php?i=\(id)"
        let response: RecipeResponse = try await fetchData(urlString: urlString, responseType: RecipeResponse.self)
        return response.meals.first
    }
    
    func extractYouTubeVideoID(from url: String) -> String? {
        let pattern = "(?<=v=|\\/v\\/|be\\/|embed\\/|\\/\\?v=|\\&v=|youtu\\.be\\/|watch\\?v%3D|\\/e\\/|\\/\\?vi=|\\&vi=)([a-zA-Z0-9_-]{11})"
        
        if let range = url.range(of: pattern, options: .regularExpression) {
            return String(url[range])
        }
        return nil
    }
}

