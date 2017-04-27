//
//  MenuItemBuilder.swift
//  AppMenu
//
//  Created by Pyryaev Stepan on 27/04/2017.
//  Copyright © 2017 stp. All rights reserved.
//

import Foundation

let MenuItemBuilderErrorDomain = "MenuItemBuilderErrorDomain"

enum MenuItemBuilderErrorCode: Int {
    case MissingTitle
}

class MenuItemBuilder {
    func buildMenuItemsFromMetadata(metadata: [[String: String]])
        -> ([MenuItem]?, NSError?) {

            var menuItems = [MenuItem]()
            var error: NSError?
            
            for dictionary in metadata {
                if let title = dictionary["title"] {
                    let menuItem = MenuItem (title: title)
                    menuItem.subTitle = dictionary["subTitle"]
                    menuItem.iconName = dictionary["iconName"]
                    menuItems.append(menuItem)
                }
                else {
                    error = missingTitleError()
                    menuItems.removeAll(keepingCapacity: false)
                    break
                }
            }
            
            return (menuItems, error)
    }
    
    private func missingTitleError() -> NSError {
        let userInfo = [NSLocalizedDescriptionKey:
            "All menu items must have a title"]
        
        return NSError(domain: MenuItemBuilderErrorDomain,
                            code: MenuItemBuilderErrorCode.MissingTitle.rawValue,
                            userInfo: userInfo)
    }
}
