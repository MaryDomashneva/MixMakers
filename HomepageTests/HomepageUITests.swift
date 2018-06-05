//
//  HomepageUITests.swift
//  HomepageUITests
//
//  Created by Jack Dewinter on 31/05/2018.
//  Copyright © 2018 MixMakers. All rights reserved.
//

import XCTest

class HomepageUITests: XCTestCase {
    
        
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
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
    }
    
    func testThatRedirectToNextScreen() {
        let app = XCUIApplication()
        app.launch()
        let textField = app.textFields["searchTextField"]
        textField.tap()
        textField.typeText("Rum")
        let addButton = app.buttons["addButton"]
        addButton.tap()
        let searchButton = app.buttons["Search"]
        searchButton.tap()
        
        XCTAssertTrue(app.navigationBars["Cocktails"].exists)
    }
    
    func testAlertMessageShownWhenNoSearchCriteria() {
        let app = XCUIApplication()
        app.launch()
        let searchButton = app.buttons["Search"]
        searchButton.tap()
        XCTAssertEqual(app.alerts.element.label, "Please, enter ingredient!")
    }
}
