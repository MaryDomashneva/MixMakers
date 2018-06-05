//
//  CocktailAPIServiceSpec.swift
//  MixMakersTests
//
//  Created by Andrew Kemp on 30/05/2018.
//  Copyright © 2018 MixMakers. All rights reserved.
//

import Foundation
import Quick
import Nimble
import OHHTTPStubs

@testable import MixMakers

class RecipeServiceSpec: QuickSpec {
    override func spec() {
        var sessionConfiguration: URLSessionConfiguration!
        var recipeService: RecipeService!
        let id: String = "13060"
        
        beforeEach {
            sessionConfiguration = URLSessionConfiguration.default
            OHHTTPStubs.setEnabled(true, for: sessionConfiguration)
            
            recipeService = RecipeService(APIKey: "1", sessionConfiguration: sessionConfiguration)
        }
        
        afterEach {
            OHHTTPStubs.removeAllStubs()
        }
        
        describe("#getRecipe") {
            context("when api returns error") {
                var expectedError: String!
                var apiError: String!
                
                beforeEach {
                    apiError = "Network connection is bad"
                    expectedError = "Network connection is bad"
                    stub(condition: isAbsoluteURLString("https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=\(id)")) { _ in
                        let error = NSError(domain: "MixMakers", code: 10101, userInfo: [NSLocalizedDescriptionKey: apiError])
                        return OHHTTPStubsResponse(error: error)
                    }
                }
                
                it("returns error in the result") {
                    var resultError: String? = nil
                    
                    waitUntil { done in
                        recipeService.getRecipe(with: id) { (cocktails, error) in
                            resultError = error
                            done()
                        }
                    }
                    
                    expect(resultError).to(equal(expectedError))
                }
                
                it("doesnt return recipe in the result") {
                    var loadedRecipes: [CocktailRecipes]? = nil
                    
                    waitUntil { done in
                        recipeService.getRecipe(with: id) { (recipe, error) in
                            loadedRecipes = recipe
                            done()
                        }
                    }
                    
                    expect(loadedRecipes).to(beNil())
                }
            }
            
            context("when api returns recipe") {
                var expectedRecipe: [CocktailRecipes]!
                
                beforeEach {
                    expectedRecipe = [
                        CocktailRecipes(strInstructions: "Rub the rim of the glass with the lime slice to make the salt stick to it. Take care to moisten only the outer rim and sprinkle the salt on it. The salt should present to the lips of the imbiber and never mix into the cocktail. Shake the other ingredients with ice, then carefully pour into the glass.",
                                        strIngredient1: "Tequila",
                                        strIngredient2: "Triple sec",
                                        strIngredient3: "Lime juice",
                                        strIngredient4: "Salt",
                                        strIngredient5: nil,
                                        strIngredient6: nil,
                                        strIngredient7: nil,
                                        strIngredient8: nil,
                                        strIngredient9: nil,
                                        strIngredient10: nil,
                                        strIngredient11: nil,
                                        strIngredient12: nil,
                                        strIngredient13: nil,
                                        strIngredient14: nil,
                                        strIngredient15: nil,
                                        strDrinkThumb: "https://www.thecocktaildb.com/images/media/drink/wpxpvu1439905379.jpg",
                                        strMeasure1: "1 1/2 oz ",
                                        strMeasure2: "1/2 oz ",
                                        strMeasure3: "1 oz ",
                                        strMeasure4: "",
                                        strMeasure5: nil,
                                        strMeasure6: nil,
                                        strMeasure7: nil,
                                        strMeasure8: nil,
                                        strMeasure9: nil,
                                        strMeasure10: nil,
                                        strMeasure11: nil,
                                        strMeasure12: nil,
                                        strMeasure13: nil,
                                        strMeasure14: nil,
                                        strMeasure15: nil,
                                        id: "13060",
                                        strDrink: "Margarita"
                        )
                    ]
                    stub(condition: isAbsoluteURLString("https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=\(id)")) { _ in
                        let stubPath = OHPathForFile("margaritaCocktail.json", type(of: self))
                        return fixture(filePath: stubPath!, headers: ["Content-Type":"application/json"])
                    }
                }
                
                it("doesnt return error in the result") {
                    var resultError: String? = nil
                    
                    waitUntil { done in
                        recipeService.getRecipe(with: id) { (recipe, error) in
                            resultError = error
                            done()
                        }
                    }
                    
                    expect(resultError).to(beNil())
                }
                
                it("returns recipe in the result") {
                    var loadedRecipe: [CocktailRecipes]? = nil
                    
                    waitUntil { done in
                        recipeService.getRecipe(with: id) { (recipe, error) in
                            loadedRecipe = recipe
                            done()
                        }
                    }
                    
                    expect(loadedRecipe).to(equal(expectedRecipe))
                }
            }
            
            context("when api returns unsuccessful response") {
                var expectedError: String!
                
                beforeEach {
                    expectedError = "Unknown response from the cocktails API"
                    stub(condition: isAbsoluteURLString("https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=\(id)")) { _ in
                        return OHHTTPStubsResponse(data: Data(), statusCode: 500, headers: nil)
                    }
                }
                
                it("returns error in the result") {
                    var resultError: String? = nil
                    
                    waitUntil { done in
                        recipeService.getRecipe(with: id) { (recipe, error) in
                            resultError = error
                            done()
                        }
                    }
                    
                    expect(resultError).to(equal(expectedError))
                }
                
                it("doesnt return cocktails array in the result") {
                    var loadedRecipe: [CocktailRecipes]? = nil
                    
                    waitUntil { done in
                        recipeService.getRecipe(with: id) { (recipe, error) in
                            loadedRecipe = recipe
                            done()
                        }
                    }
                    
                    expect(loadedRecipe).to(beNil())
                }
            }
        }
    }
}


