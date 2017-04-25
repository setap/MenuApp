//
//  MenuItemTests.swift
//  AppMenu
//
//  Created by Pyryaev Stepan on 24/04/2017.
//  Copyright © 2017 stp. All rights reserved.
//

import XCTest

class MenuItemTests: XCTestCase {
    var menuItem: MenuItem?
    
    override func setUp() {
        super.setUp()
        menuItem = MenuItem(title: "Contributions")
        
    }
    
    func testThatMenuItemHasATitle() {
        XCTAssertEqual(menuItem!.title, "Contributions",
                       "A title should always be present")
    }
    
    func testThatMenuItemCanBeAssignedASubTitle() {
        menuItem!.subTitle = "Repos contributed to"
        XCTAssertEqual(menuItem!.subTitle!, "Repos contributed to")
    }
    
    func testThatMenuItemCanBeAssignAnIconName() {
        menuItem!.iconName = "iconContributions"
        XCTAssertEqual(menuItem!.iconName!, "iconContributions")
    }
}
