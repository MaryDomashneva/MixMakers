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
    typealias QueryArrayResult = ([SimpleCoctail]?, String?) -> Void
    
    // Sample url: https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita
    let cocktailAPIKey: String
    let cocktailBaseURLString: String = "https://www.thecocktaildb.com/api/json/v1"
    let session: URLSession = URLSession(configuration: .default)
    
    init(APIKey: String = "1")
    {
        self.cocktailAPIKey = APIKey
    }
    
    // Example url https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Gin
    func getAllCocktails(with ingredient: String, result: @escaping QueryArrayResult)
    {
        let path = "filter.php?i=\(ingredient)"
        guard let getAllCoctailsURL = buildURL(with: cocktailBaseURLString, apiKey: cocktailAPIKey, path: path) else {
            result(nil, "Get all coctails URL can not be built")
            return
        }
        
        let dataTask = session.dataTask(with: getAllCoctailsURL)
        { [weak self] data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    result(nil, error.localizedDescription)
                }
            } else if let data = data,
                      let response = response as? HTTPURLResponse,
                      response.statusCode == 200 {
                let coctails = self?.parseCoctailsJSON(data: data, rootKey: "drinks")
                
                // Call the block on the main thread
                DispatchQueue.main.async {
                    result(coctails, nil)
                }
            } else {
                DispatchQueue.main.async {
                    result(nil, "Unknown response from the coctails API")
                }
            }
        }
        dataTask.resume() //send request to the server
    }
    
    private func parseCoctailsJSON(data: Data, rootKey: String) -> [SimpleCoctail] {
        do {
            let result = try JSONDecoder().decode([String: [SimpleCoctail]].self, from: data)
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
