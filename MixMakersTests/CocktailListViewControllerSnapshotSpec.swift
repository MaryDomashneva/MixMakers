//
//  CocktailListViewControllerSnapshotSpec.swift
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

class CocktailListViewControllerSnapshotSpec: QuickSpec {
    override func spec() {
        var viewController: CocktailListViewController!
        
        beforeEach {
            viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Cocktails") as! CocktailListViewController
        }
        
        afterEach {
            OHHTTPStubs.removeAllStubs()
        }
        
        describe("when failed to load cocktails") {
            let ingredient = "Gin"
            
            beforeEach {
                stub(condition: isAbsoluteURLString("https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=\(ingredient)")) { _ in
                    let error = NSError(domain: "MixMakers", code: 10101, userInfo: [NSLocalizedDescriptionKey: "Error description"])
                    return OHHTTPStubsResponse(error: error)
                }
            }
            
            it("has valid snapshot") {
                viewController.searchTerm = [ingredient]
                let view = viewController.view
                waitUntil { done in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        done()
                    }
                }
                expect(view).to( haveValidSnapshot() )
            }
        }
        
        describe("with one cocktail loaded") {
            let ingredient = "Gin"
            
            beforeEach {
                stub(condition: isAbsoluteURLString("https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=\(ingredient)")) { _ in
                    let stubPath = OHPathForFile("one_cocktail.json", type(of: self))
                    return fixture(filePath: stubPath!, headers: ["Content-Type":"application/json"])
                }
            }
            
            it("has valid snapshot") {
                viewController.searchTerm = [ingredient]
                let view = viewController.view
                waitUntil { done in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        done()
                    }
                }
                expect(view).to( haveValidSnapshot() )
            }
        }
        
        describe("with two cocktails loaded") {
            let ingredient = "Gin"
            
            beforeEach {
                stub(condition: isAbsoluteURLString("https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=\(ingredient)")) { _ in
                    let stubPath = OHPathForFile("two_cocktails.json", type(of: self))
                    return fixture(filePath: stubPath!, headers: ["Content-Type":"application/json"])
                }
            }
            
            it("has valid snapshot") {
                viewController.searchTerm = [ingredient]
                let view = viewController.view
                waitUntil { done in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        done()
                    }
                }
                expect(view).to( haveValidSnapshot() )
            }
        }
        
        describe("with five cocktails loaded") {
            let ingredient = "Gin"
            
            beforeEach {
                stub(condition: isAbsoluteURLString("https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=\(ingredient)")) { _ in
                    let stubPath = OHPathForFile("five_cocktails.json", type(of: self))
                    return fixture(filePath: stubPath!, headers: ["Content-Type":"application/json"])
                }
            }
            
            it("has valid snapshot") {
                viewController.searchTerm = [ingredient]
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
