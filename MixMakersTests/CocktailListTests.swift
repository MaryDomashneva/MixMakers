//
//  CocktailListTests.swift
//  MixMakersTests
//
//  Created by Jack Dewinter on 02/06/2018.
//  Copyright © 2018 MixMakers. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import MixMakers

class CocktailListSpec: QuickSpec {
    
    override func spec() {
    
    
        context("when searching for multiple ingredients") {
            var cocktailSearch = CombineSearch()
            var expectedCocktails: [SimpleCocktail]!
            var milkCocktails: [SimpleCocktail]!
            var chocolateCocktails: [SimpleCocktail]!
            var mixCocktails: [[SimpleCocktail]] = []
        
            beforeEach {
                expectedCocktails = [
                    SimpleCocktail(name: "Chocolate Beverage",
                                   imageURLString: "https://www.thecocktaildb.com/images/media/drink/jbqrhv1487603186.jpg",
                                   id: "12732"),
                    SimpleCocktail(name: "Chocolate drink",
                                   imageURLString: "https://www.thecocktaildb.com/images/media/drink/q7w4xu1487603180.jpg",
                                   id: "12734")
                ]
        
                milkCocktails = [
                    SimpleCocktail(name: "Chocolate Beverage",
                                   imageURLString: "https://www.thecocktaildb.com/images/media/drink/jbqrhv1487603186.jpg",
                                   id: "12732"),
                    SimpleCocktail(name: "Nutty Irishman",
                                   imageURLString: "https://www.thecocktaildb.com/images/media/drink/xspupx1441248014.jpg",
                                   id: "13861"),
                ]
        
                chocolateCocktails = [
                    SimpleCocktail(name: "Chocolate drink",
                                   imageURLString: "https://www.thecocktaildb.com/images/media/drink/q7w4xu1487603180.jpg",
                                   id: "12734"),
                    SimpleCocktail(name: "Chocolate Beverage",
                                   imageURLString: "https://www.thecocktaildb.com/images/media/drink/jbqrhv1487603186.jpg",
                                   id: "12732")
                ]
        
                mixCocktails = [
                    milkCocktails,
                    chocolateCocktails
                ]
            }
        
            it("returns intersaction cocktails") {
                let result = cocktailSearch.combine(with: mixCocktails)
                expect(result).to(equal(expectedCocktails))
            }
        }
    }
}
