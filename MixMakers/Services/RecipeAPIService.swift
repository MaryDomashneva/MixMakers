//
//  CocktailAPIServise.swift
//  MixMakers
//
//  Created by Maria Getmanova on 29/05/2018.
//  Copyright © 2018 MixMakers. All rights reserved.
//

import Foundation

class RecipeService
{
    typealias QueryArrayResult = ([CocktailRecipes]?, String?) -> Void
    
    // Sample url: https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=13060
    let recipeAPIKey: String
    let recipeBaseURLString: String = "https://www.thecocktaildb.com/api/json/v1"
    let session: URLSession
    
    init(APIKey: String = "1", sessionConfiguration: URLSessionConfiguration = .default)
    {
        self.session = URLSession(configuration: sessionConfiguration)
        self.recipeAPIKey = APIKey
    }
    
    func getRecipe(with id: String, result: @escaping QueryArrayResult)
    {
        let path = "lookup.php?i=\(id)"
        guard let getRecipeURL = buildURL(with: recipeBaseURLString, apiKey: recipeAPIKey, path: path) else {
            result(nil, "Get recipe URL can not be built")
            return
        }
        
        let dataTask = session.dataTask(with: getRecipeURL)
        { [weak self] data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    result(nil, error.localizedDescription)
                }
            } else if let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 {
                let recipe = self?.parseRecipeJSON(data: data, rootKey: "drinks")
                
                // Call the block on the main thread
                DispatchQueue.main.async {
                    result(recipe, nil)
                }
            } else {
                DispatchQueue.main.async {
                    result(nil, "Unknown response from the cocktails API")
                }
            }
        }
        dataTask.resume() //send request to the server
    }
    
    private func parseRecipeJSON(data: Data, rootKey: String) -> [CocktailRecipes] {
        do {
            let result = try JSONDecoder().decode([String: [CocktailRecipes]].self, from: data)
            return result[rootKey] ?? [] //get array with recipe
        }
        catch {
            return []
        }
    }
    
    private func buildURL(with baseURLString: String, apiKey: String, path: String) -> URL?
    {
        return URL(string: "\(baseURLString)/\(apiKey)/\(path)")
    }
}

