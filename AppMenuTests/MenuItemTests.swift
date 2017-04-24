//
//  MenuItemTests.swift
//  AppMenu
//
//  Created by Pyryaev Stepan on 24/04/2017.
//  Copyright © 2017 stp. All rights reserved.
//

import XCTest

class MenuItemTests: XCTestCase {
    
    func testThatMenuItemHasATitle() {
        let menuItem = MenuItem(title: "Contributions")
        XCTAssertEqual(menuItem.title, "Contributions",
                       "A title should always be present")
    }
    
    func testThatMenuItemCanBeAssignedASubTitle() {
        let menuItem = MenuItem(title: "Contributions")
        menuItem.subTitle = "Repos contributed to"
        XCTAssertEqual(menuItem.subTitle!, "Repos contributed to")
    }
    
    func testThatMenuItemCanBeAssignAnIconName() {
        let menuItem = MenuItem(title: "Contributions")
        menuItem.iconName = "iconContributions"
        XCTAssertEqual(menuItem.iconName!, "iconContributions")
    }
}
