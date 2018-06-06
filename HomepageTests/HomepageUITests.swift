//
//  HomepageUITests.swift
//  HomepageUITests
//
//  Created by Jack Dewinter on 31/05/2018.
//  Copyright © 2018 MixMakers. All rights reserved.
//

import XCTest

extension XCTestCase {
    func wait(forElement element: XCUIElement, timeout: TimeInterval) {
        let predicate = NSPredicate(format: "exists == 1")
        // This will make the test runner continously evalulate the
        // predicate, and wait until it matches.
        expectation(for: predicate, evaluatedWith: element)
        waitForExpectations(timeout: timeout)
    }
}

class HomepageUITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSearchButtonExists() {
        let app = XCUIApplication()
        app.launch()
        let searchButton = app.buttons["Search"]
        XCTAssertTrue(searchButton.exists, "Search button exists")
    }
    
    func testInvalidSearchGivesCocktailsNotFoundText() {
        let app = XCUIApplication()
        app.launch()
        let searchButton = app.buttons["Search"]
        let textField = app.textFields["searchTextField"]
        let addButton = app.buttons["addButton"]
        textField.tap()
        textField.typeText("WWWWWWWW")
        addButton.tap()
        searchButton.tap()
        wait(forElement: app.staticTexts["Cocktails not found"], timeout: 5)
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
        XCTAssertEqual(app.alerts.element.label, "Please, enter an ingredient!")
    }
    
    
    func testIngredientOneAdded() {
        let app = XCUIApplication()
        app.launch()
        let textField = app.textFields["searchTextField"]
        let addButton = app.buttons["addButton"]
        textField.tap()
        textField.typeText("Vodka")
        addButton.tap()
        XCTAssertTrue(app.buttons["Vodka"].exists)
    }
    
    func testIngredientTwoAdded() {
        let app = XCUIApplication()
        app.launch()
        let textField = app.textFields["searchTextField"]
        let addButton = app.buttons["addButton"]
        textField.tap()
        textField.typeText("Vodka")
        addButton.tap()
        textField.tap()
        textField.typeText("Gin")
        addButton.tap()
        XCTAssertTrue(app.buttons["Gin"].exists)
    }
    
    func testIngredientThreeAdded() {
        let app = XCUIApplication()
        app.launch()
        let textField = app.textFields["searchTextField"]
        let addButton = app.buttons["addButton"]
        textField.tap()
        textField.typeText("Vodka")
        addButton.tap()
        textField.tap()
        textField.typeText("Gin")
        addButton.tap()
        textField.tap()
        textField.typeText("Tequila")
        addButton.tap()
        XCTAssertTrue(app.buttons["Tequila"].exists)
    }
    
    func testIngredientOneDisappearsAfterTap() {
        let app = XCUIApplication()
        app.launch()
        let textField = app.textFields["searchTextField"]
        let addButton = app.buttons["addButton"]
        textField.tap()
        textField.typeText("Vodka")
        addButton.tap()
        app.buttons["Vodka"].tap()
        XCTAssertFalse(app.buttons["Vodka"].exists)
    }
    
    func testIngredientOneDisappearsAfterTapMultipleIngredients() {
        let app = XCUIApplication()
        app.launch()
        let textField = app.textFields["searchTextField"]
        let addButton = app.buttons["addButton"]
        textField.tap()
        textField.typeText("Vodka")
        addButton.tap()
        textField.tap()
        textField.typeText("Gin")
        addButton.tap()
        textField.tap()
        textField.typeText("Tequila")
        addButton.tap()
        app.buttons["Vodka"].tap()
        XCTAssertFalse(app.buttons["Vodka"].exists)
    }
    
    func testIngredientTwoDisappearsAfterTap() {
        let app = XCUIApplication()
        app.launch()
        let textField = app.textFields["searchTextField"]
        let addButton = app.buttons["addButton"]
        textField.tap()
        textField.typeText("Vodka")
        addButton.tap()
        textField.tap()
        textField.typeText("Gin")
        addButton.tap()
        app.buttons["Gin"].tap()
        XCTAssertFalse(app.buttons["Gin"].exists)
    }
    
    func testIngredientTwoDisappearsAfterTapMultipleIngredients() {
        let app = XCUIApplication()
        app.launch()
        let textField = app.textFields["searchTextField"]
        let addButton = app.buttons["addButton"]
        textField.tap()
        textField.typeText("Vodka")
        addButton.tap()
        textField.tap()
        textField.typeText("Gin")
        addButton.tap()
        textField.tap()
        textField.typeText("Tequila")
        addButton.tap()
        app.buttons["Gin"].tap()
        XCTAssertFalse(app.buttons["Gin"].exists)
    }
    
    func testIngredientTreeDisappearsAfterTapMultipleIngredients() {
        let app = XCUIApplication()
        app.launch()
        let textField = app.textFields["searchTextField"]
        let addButton = app.buttons["addButton"]
        textField.tap()
        textField.typeText("Vodka")
        addButton.tap()
        textField.tap()
        textField.typeText("Gin")
        addButton.tap()
        textField.tap()
        textField.typeText("Tequila")
        addButton.tap()
        app.buttons["Tequila"].tap()
        XCTAssertFalse(app.buttons["Tequila"].exists)
    }
    
    func testNavigateBackToSearchScreenAfterSearch() {
        let app = XCUIApplication()
        app.launch()
        let searchButton = app.buttons["Search"]
        let textField = app.textFields["searchTextField"]
        let addButton = app.buttons["addButton"]
        textField.tap()
        textField.typeText("Vodka")
        addButton.tap()
        searchButton.tap()
        app.navigationBars["Cocktails"].buttons["Search"].tap()
        XCTAssertTrue(app.navigationBars["Search"].exists)
    }
    
    func testMultiIngredientSearch() {
        let app = XCUIApplication()
        app.launch()
        let searchButton = app.buttons["Search"]
        let textField = app.textFields["searchTextField"]
        let addButton = app.buttons["addButton"]
        textField.tap()
        textField.typeText("Vodka")
        addButton.tap()
        textField.tap()
        textField.typeText("Gin")
        addButton.tap()
        searchButton.tap()
        XCTAssertTrue(app.navigationBars["Cocktails"].exists)
    }
}
