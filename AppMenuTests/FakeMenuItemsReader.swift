//
//  FakeMenuItemsReader.swift
//  AppMenu
//
//  Created by Pyryaev Stepan on 27/04/2017.
//  Copyright © 2017 stp. All rights reserved.
//

import Foundation

class FakeMenuItemsReader: MenuItemsReader {
    var missingTitle: Bool = false
    
    func readMenuItems() -> ([[String : String]]?, NSError?) {
        let menuItem1 = missingTitle ? menuItem1WithMissingTitle() :
                                       menuItem1WithNoMissingTitle()
        
        let menuItem2 = ["title" :"Menu Item 2",
                         "subTitle": "Menu Item 1 subtitle",
                         "iconName": "iconName1"]
        
        return ([menuItem1, menuItem2], nil)
    }
    
    func menuItem1WithMissingTitle() -> [String: String] {
        return ["subTitle": "Menu Item 1 subtitle",
                "iconName": "iconName1"]
    }
    
    func menuItem1WithNoMissingTitle() -> [String: String] {
        var menuItem = menuItem1WithMissingTitle()
        menuItem["title"] = "Menu Item 1"
        return menuItem
    }
}
