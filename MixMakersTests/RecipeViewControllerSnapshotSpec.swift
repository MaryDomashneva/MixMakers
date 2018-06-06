//
//  RecipeViewControllerSnapshotSpec.swift
//  MixMakersTests
//
//  Created by Maria Getmanova on 05/06/2018.
//  Copyright © 2018 MixMakers. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots
import UIKit
import OHHTTPStubs

@testable import MixMakers

class RecipeViewControllerSnapshotSpec: QuickSpec {
    override func spec() {
        var viewController: recipeViewController!
        
        beforeEach {
            viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RecipeViewController") as! recipeViewController
        }
        
        afterEach {
            OHHTTPStubs.removeAllStubs()
        }
    
        describe("when loaded ingredients") {
            var expectedCocktail = SimpleCocktail(name: "Margarita",
                                          imageURLString: "https://www.thecocktaildb.com/images/media/drink/wpxpvu1439905379.jpg",
                                          id: "13060")
            
            beforeEach {
                stub(condition: isAbsoluteURLString("https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=13060")) { _ in
                    let stubPath = OHPathForFile("margaritaCocktail.json", type(of: self))
                    return fixture(filePath: stubPath!, headers: ["Content-Type":"application/json"])
                }
            }
            
            it("has valid snapshot") {
                viewController.cocktail = expectedCocktail
                let view = viewController.view
                waitUntil { done in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        done()
                    }
                }
                expect(view).to( haveValidSnapshot() )
            }
        }
    }
}
