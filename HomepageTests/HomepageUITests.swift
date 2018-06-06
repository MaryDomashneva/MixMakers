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
    
    func testInvalidSearchGivesCocktailsNotFoundText() {
        let app = XCUIApplication()
        app.launch()
        let searchButton = app.buttons["Search"]
        let textField = app.textFields["searchTextField"]
        let addButton = app.buttons["addButton"]
        let loadingLabel = app.staticTexts["Cocktails not found"]
        textField.tap()
        textField.typeText("WWWWWWWW")
        addButton.tap()
        searchButton.tap()
        XCTAssertEqual(loadingLabel.exists, true)
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
    
    
    func testOneIngredientSelected() {
        let app = XCUIApplication()
        app.launch()
        let textField = app.textFields["searchTextField"]
        let addButton = app.buttons["addButton"]
        textField.tap()
        textField.typeText("Vodka")
        addButton.tap()
        XCTAssertTrue(app.buttons["Vodka"].exists)
    }
    
    func testTwoIngredientsSelected() {
        let app = XCUIApplication()
        app.launch()
        let textField = app.textFields["searchTextField"]
        let addButton = app.buttons["addButton"]
        textField.tap()
        textField.typeText("Vodka")
        addButton.tap()
        textField.doubleTap()
        app/*@START_MENU_TOKEN@*/.menuItems["Cut"]/*[[".menus.menuItems[\"Cut\"]",".menuItems[\"Cut\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        textField.typeText("Gin")
        addButton.tap()
        XCTAssertTrue(app.buttons["Gin"].exists)
    }
    
    func testThreeIngredientsSelected() {
        let app = XCUIApplication()
        app.launch()
        let textField = app.textFields["searchTextField"]
        let addButton = app.buttons["addButton"]
        textField.tap()
        textField.typeText("Vodka")
        addButton.tap()
        textField.doubleTap()
        app/*@START_MENU_TOKEN@*/.menuItems["Cut"]/*[[".menus.menuItems[\"Cut\"]",".menuItems[\"Cut\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        textField.typeText("Gin")
        addButton.tap()
        textField.doubleTap()
        app/*@START_MENU_TOKEN@*/.menuItems["Cut"]/*[[".menus.menuItems[\"Cut\"]",".menuItems[\"Cut\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        textField.typeText("Tequila")
        addButton.tap()
        XCTAssertTrue(app.buttons["Tequila"].exists)
    }
    
    func testIngredientOneDisappearsAfterSelected() {
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
    
    func testIngredientsTwoDisappearsAfterSelected() {
        let app = XCUIApplication()
        app.launch()
        let textField = app.textFields["searchTextField"]
        let addButton = app.buttons["addButton"]
        textField.tap()
        textField.typeText("Vodka")
        addButton.tap()
        textField.doubleTap()
        app/*@START_MENU_TOKEN@*/.menuItems["Cut"]/*[[".menus.menuItems[\"Cut\"]",".menuItems[\"Cut\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        textField.typeText("Gin")
        addButton.tap()
        app.buttons["Gin"].tap()
        XCTAssertFalse(app.buttons["Gin"].exists)
    }
    
    func testIngredientsThreeDisappearsAfterSelected() {
        let app = XCUIApplication()
        app.launch()
        let textField = app.textFields["searchTextField"]
        let addButton = app.buttons["addButton"]
        textField.tap()
        textField.typeText("Vodka")
        addButton.tap()
        textField.doubleTap()
        app/*@START_MENU_TOKEN@*/.menuItems["Cut"]/*[[".menus.menuItems[\"Cut\"]",".menuItems[\"Cut\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        textField.typeText("Gin")
        addButton.tap()
        textField.doubleTap()
        app/*@START_MENU_TOKEN@*/.menuItems["Cut"]/*[[".menus.menuItems[\"Cut\"]",".menuItems[\"Cut\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        textField.typeText("Tequila")
        addButton.tap()
        app.buttons["Tequila"].tap()
        XCTAssertFalse(app.buttons["Tequila"].exists)
    }
    
    func testFirstIngredientDisappearsAfterSelected() {
        let app = XCUIApplication()
        app.launch()
        let textField = app.textFields["searchTextField"]
        let addButton = app.buttons["addButton"]
        textField.tap()
        textField.typeText("Vodka")
        addButton.tap()
        textField.doubleTap()
        app/*@START_MENU_TOKEN@*/.menuItems["Cut"]/*[[".menus.menuItems[\"Cut\"]",".menuItems[\"Cut\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        textField.typeText("Gin")
        addButton.tap()
        textField.doubleTap()
        app/*@START_MENU_TOKEN@*/.menuItems["Cut"]/*[[".menus.menuItems[\"Cut\"]",".menuItems[\"Cut\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        textField.typeText("Tequila")
        addButton.tap()
        app.buttons["Vodka"].tap()
        XCTAssertFalse(app.buttons["Vodka"].exists)
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
        textField.doubleTap()
        app/*@START_MENU_TOKEN@*/.menuItems["Cut"]/*[[".menus.menuItems[\"Cut\"]",".menuItems[\"Cut\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        textField.typeText("Gin")
        addButton.tap()
        searchButton.tap()
        XCTAssertTrue(app.navigationBars["Cocktails"].exists)
    }
}
