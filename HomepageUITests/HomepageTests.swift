//
//  HomepageTests.swift
//  MixMakersTests
//
//  Created by Jack Dewinter on 31/05/2018.
//  Copyright © 2018 MixMakers. All rights reserved.
//

import XCTest
@testable import MixMakers

class HomepageTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        var homepageViewController: HomepageViewController!
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSearch() {
        let app = XCUIApplication()
        app.launch()
        let searchButton = app.buttons["Search"]
        XCTAssertTrue(searchButton.exists, "Search button exists")
//        let resultView = storyboard?.instantiateViewController(withIdentifier: "Cocktails") as! CocktailListViewController
        
        
    }
    
   
    
}
