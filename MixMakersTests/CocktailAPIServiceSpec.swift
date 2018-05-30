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

class CocktailServiceSpec: QuickSpec {
    override func spec() {
        var sessionConfiguration: URLSessionConfiguration!
        var cocktailService: CocktailService!
        let ingredient: String = "Gin"
        
        beforeEach {
            sessionConfiguration = URLSessionConfiguration.default
            OHHTTPStubs.setEnabled(true, for: sessionConfiguration)
            
            cocktailService = CocktailService(APIKey: "1", sessionConfiguration: sessionConfiguration)
        }
        
        afterEach {
            OHHTTPStubs.removeAllStubs()
        }
        
        describe("#getAllCocktails") {
            context("when api returns error") {
                var expectedError: String!
                var apiError: String!
                
                beforeEach {
                    apiError = "Network connection is bad"
                    expectedError = "Network connection is bad"
                    stub(condition: isAbsoluteURLString("https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=\(ingredient)")) { _ in
                        let error = NSError(domain: "MixMakers", code: 10101, userInfo: [NSLocalizedDescriptionKey: apiError])
                        return OHHTTPStubsResponse(error: error)
                    }
                }
                
                it("returns error in the result") {
                    var resultError: String? = nil
                    
                    waitUntil { done in
                        cocktailService.getAllCocktails(with: ingredient) { (cocktails, error) in
                            resultError = error
                            done()
                        }
                    }
                    
                    expect(resultError).to(equal(expectedError))
                }
                
                it("doesnt return cocktails array in the result") {
                    var loadedCocktains: [SimpleCocktail]? = nil
                    
                    waitUntil { done in
                        cocktailService.getAllCocktails(with: ingredient) { (cocktails, error) in
                            loadedCocktains = cocktails
                            done()
                        }
                    }
                    
                    expect(loadedCocktains).to(beNil())
                }
            }
            
            context("when api returns cocktails") {
                var expectedCocktails: [SimpleCocktail]!
                
                beforeEach {
                    expectedCocktails = [
                        SimpleCocktail(name: "3-Mile Long Island Iced Tea",
                                      imageURLString: "https://www.thecocktaildb.com/images/media/drink/rrtssw1472668972.jpg",
                                      id: "15300"),
                        SimpleCocktail(name: "69 Special",
                                      imageURLString: "https://www.thecocktaildb.com/images/media/drink/vqyxqx1472669095.jpg",
                                      id: "13940"),
                    ]
                    stub(condition: isAbsoluteURLString("https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=\(ingredient)")) { _ in
                        let stubPath = OHPathForFile("load_cocktails_with_gin.json", type(of: self))
                        return fixture(filePath: stubPath!, headers: ["Content-Type":"application/json"])
                    }
                }
                
                it("doesnt return error in the result") {
                    var resultError: String? = nil
                    
                    waitUntil { done in
                        cocktailService.getAllCocktails(with: ingredient) { (cocktails, error) in
                            resultError = error
                            done()
                        }
                    }
                    
                    expect(resultError).to(beNil())
                }
                
                it("returns cocktails array in the result") {
                    var loadedCocktains: [SimpleCocktail]? = nil
                    
                    waitUntil { done in
                        cocktailService.getAllCocktails(with: ingredient) { (cocktails, error) in
                            loadedCocktains = cocktails
                            done()
                        }
                    }
                    
                    expect(loadedCocktains).to(equal(expectedCocktails))
                }
            }
            
            context("when api returns unsuccessful response") {
                var expectedError: String!
                
                beforeEach {
                    expectedError = "Unknown response from the cocktails API"
                    stub(condition: isAbsoluteURLString("https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=\(ingredient)")) { _ in
                        return OHHTTPStubsResponse(data: Data(), statusCode: 500, headers: nil)
                    }
                }
                
                it("returns error in the result") {
                    var resultError: String? = nil
                    
                    waitUntil { done in
                        cocktailService.getAllCocktails(with: ingredient) { (cocktails, error) in
                            resultError = error
                            done()
                        }
                    }
                    
                    expect(resultError).to(equal(expectedError))
                }
                
                it("doesnt return cocktails array in the result") {
                    var loadedCocktains: [SimpleCocktail]? = nil
                   
                    waitUntil { done in
                        cocktailService.getAllCocktails(with: ingredient) { (cocktails, error) in
                            loadedCocktains = cocktails
                            done()
                        }
                    }
                    
                    expect(loadedCocktains).to(beNil())
                }
            }
        }
    }
}
