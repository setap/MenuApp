//
//  MenuItemsPlistReader.swift
//  AppMenu
//
//  Created by Pyryaev Stepan on 25/04/2017.
//  Copyright © 2017 stp. All rights reserved.
//

import Foundation

class MenuItemsPlistReader: MenuItemsReader {
    var plistToReadFrom: String? = nil
    let MenuItemsPlistReaderErrorDomain = "MenuItemsPlistReaderErrorDomain"
    
    enum MenuItemPlistReaderErrorCode: Int {
        case FileNotFound
    }
    
    func readMenuItems() -> ([[String : String]]?, NSError?) {
        let errorMessage = "\(plistToReadFrom!).plist file doesn't exist in app bundle"
        
        let userInfo = [NSLocalizedDescriptionKey: errorMessage]
        
        let error = NSError(domain: MenuItemsPlistReaderErrorDomain,
                            code: MenuItemPlistReaderErrorCode.FileNotFound.rawValue,
                            userInfo: userInfo)
        return ([], error)
    }
}
