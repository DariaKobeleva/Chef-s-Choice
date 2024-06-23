//
//  NetworkManager.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 08.06.2024.
//

import Foundation

class NetworkManager: ObservableObject {
    @Published var categories: [Category] = []
    @Published var cuisines: [Cuisine] = []
    @Published var ingredients: [Ingredient] = []
    @Published var recipes: [Recipe] = []
    @Published var selectedRecipe: Recipe?
    @Published var videoID: String?
    
    private let baseUrl = "https://www.themealdb.com/api/json/v1/1/"
    
    private func fetchData<T: Decodable>(
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
    
    func fetchRecipeDetails(by id: String) async {
            let urlString = "\(baseUrl)lookup.php?i=\(id)"
            await fetchData(
                urlString: urlString,
                responseType: RecipeResponse.self
            ) { [unowned self] response in
                selectedRecipe = response.meals.first
            }
        }
    
    func fetchCategories() async {
        await fetchData(
            urlString: "\(baseUrl)categories.php",
            responseType: CategoryResponse.self
        ) { [unowned self] response in
            categories = response.categories
        }
    }
    
    func fetchCuisines() async {
        await fetchData(
            urlString: "\(baseUrl)list.php?a=list",
            responseType: CuisineResponse.self
        ) { [unowned self] response in
            cuisines = response.meals
        }
    }
    
    func fetchIngredient() async {
        await fetchData(
            urlString: "\(baseUrl)list.php?i=list",
            responseType: IngredientResponse.self
        ) { [unowned self] response in
            ingredients = response.meals
        }
    }
    
    func fetchRecipesByCategories(_ category: String) async {
        let urlString = "\(baseUrl)filter.php?c=\(category)"
        await fetchData(
            urlString: urlString,
            responseType: RecipeResponse.self
        ) { [unowned self] response in
            recipes = response.meals
        }
    }
    
    
    func fetchRecipesByCuisines(_ cuisine: String) async {
        let urlString = "\(baseUrl)filter.php?a=\(cuisine)"
        await fetchData(
            urlString: urlString,
            responseType: RecipeResponse.self
        ) { [unowned self] response in
            recipes = response.meals
        }
    }
    
    func fetchRecipesByIngredient(_ ingredient: String) async {
        let urlString = "\(baseUrl)filter.php?i=\(ingredient)"
        await fetchData(
            urlString: urlString,
            responseType: RecipeResponse.self
        ) { [unowned self] response in
            recipes = response.meals
        }
    }
    
    func extractYouTubeVideoID(from url: String) -> String? {
          let pattern = "(?<=v=|\\/v\\/|be\\/|embed\\/|\\/\\?v=|\\&v=|youtu\\.be\\/|watch\\?v%3D|\\/e\\/|\\/\\?vi=|\\&vi=)([a-zA-Z0-9_-]{11})"
          
          if let range = url.range(of: pattern, options: .regularExpression) {
              return String(url[range])
          }
          return nil
      }
}
