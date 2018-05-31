//
//  HomepageUITests.swift
//  MixMakers
//
//  Created by Jack Dewinter on 30/05/2018.
//  Copyright © 2018 MixMakers. All rights reserved.
//

import UIKit
import XCTest
@testable import MixMakers


class HomepageUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()

        
        continueAfterFailure = false

        XCUIApplication().launch()

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSearchField() {
        
        let app = XCUIApplication()
        app.launch()
        let searchTextField = app.textFields["searchTerm"]
        searchTextField.tap()
        searchTextField.typeText("vodka")
        app.buttons["Search"].tap()
        

    }
    
}
