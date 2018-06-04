//
//  CocktailAPIServise.swift
//  MixMakers
//
//  Created by Maria Getmanova on 29/05/2018.
//  Copyright © 2018 MixMakers. All rights reserved.
//

import Foundation

class CocktailService
{
    typealias QueryArrayResult = ([SimpleCocktail]?, String?) -> Void
    
    // Sample url: https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita
    
    let cocktailAPIKey: String
    let cocktailBaseURLString: String = "https://www.thecocktaildb.com/api/json/v1"
    let session: URLSession
    
    init(APIKey: String = "1", sessionConfiguration: URLSessionConfiguration = .default)
    {
        self.session = URLSession(configuration: sessionConfiguration)
        self.cocktailAPIKey = APIKey
    }
    
    // Example url https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Gin
    func getAllCocktails(with ingredient: String, result: @escaping QueryArrayResult)
    {
        let newIngredient = ingredient.replacingOccurrences(of: " ", with: "%20")
        let path = "filter.php?i=\(newIngredient)"
        guard let getAllCocktailsURL = buildURL(with: cocktailBaseURLString, apiKey: cocktailAPIKey, path: path) else {
            result(nil, "Get all cocktails URL can not be built")
            return
        }
        
        let dataTask = session.dataTask(with: getAllCocktailsURL)
        { [weak self] data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    result(nil, error.localizedDescription)
                }
            } else if let data = data,
                      let response = response as? HTTPURLResponse,
                      response.statusCode == 200 {
                let cocktails = self?.parseCocktailsJSON(data: data, rootKey: "drinks")
                
                // Call the block on the main thread
                DispatchQueue.main.async {
                    result(cocktails, nil)
                }
            } else {
                DispatchQueue.main.async {
                    result(nil, "Unknown response from the cocktails API")
                }
            }
        }
        dataTask.resume() //send request to the server
    }
    
    private func parseCocktailsJSON(data: Data, rootKey: String) -> [SimpleCocktail] {
        do {
            let result = try JSONDecoder().decode([String: [SimpleCocktail]].self, from: data)
            return result[rootKey] ?? [] //get array with drinks
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
