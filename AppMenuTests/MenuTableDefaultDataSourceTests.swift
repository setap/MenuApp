//
//  MenuTableDefaultDataSourceTests.swift
//  AppMenu
//
//  Created by Pyryaev Stepan on 27/04/2017.
//  Copyright © 2017 stp. All rights reserved.
//

import XCTest
import UIKit

class MenuTableDefaultDataSourceTests: XCTestCase {
    var dataSource: MenuTableDefaultDataSource?
    var menuItemList: [MenuItem]?
    var tableView: UITableView?
    
    override func setUp() {
        super.setUp()
        
        let testMenuItem = MenuItem(title: "Test menu item")
        menuItemList = [testMenuItem]
        
        dataSource = MenuTableDefaultDataSource()
        dataSource!.setMenuItems(menuItems: menuItemList!)
        
        tableView = UITableView()
    }
    
    func testReturnsOneRowForOneMenuItem() {
        let numberOfRows = dataSource!.tableView(tableView!, numberOfRowsInSection: 0)
        XCTAssertEqual(numberOfRows, menuItemList!.count,
                       "Only 1 row is returned since we're passing 1 menu item")
    }
    
    func testReturnOnlyOneSection() {
        let numberOfSections = dataSource?.numberOfSections(in: tableView!)
        XCTAssertEqual(numberOfSections, 1,
                       "There should only be one section")
    }
    
    func testEachCellContainsTitleForRespectiveMenuItem() {
        let firstMenuItem = NSIndexPath(row: 0, section: 0)
        let cell = dataSource?.tableView(tableView!, cellForRowAt: firstMenuItem as IndexPath)
        
        XCTAssertEqual(cell?.textLabel?.text!, "Test menu item",
                       "A cell contains the title of a menu item it's representing")
    }
}
