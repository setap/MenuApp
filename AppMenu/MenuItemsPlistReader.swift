//
//  MenuItemsPlistReader.swift
//  AppMenu
//
//  Created by Pyryaev Stepan on 25/04/2017.
//  Copyright © 2017 stp. All rights reserved.
//

import Foundation

let MenuItemsPlistReaderErrorDomain = "MenuItemsPlistReaderErrorDomain"

enum MenuItemPlistReaderErrorCode: Int {
    case FileNotFound
}


class MenuItemsPlistReader: MenuItemsReader {
    var plistToReadFrom: String? = nil
    
    func readMenuItems() -> ([[String : String]]?, NSError?) {
        var error: NSError? = nil
        var fileContents: [[String: String]]? = nil
        let bundle = Bundle(for: object_getClass(self))
        
        if let filePath = bundle.path(forResource: plistToReadFrom, ofType: "plist") {
            fileContents = NSArray(contentsOfFile: filePath) as? [[String: String]]
        } else {
            error = fileNotFoundError()
        }
        return (fileContents, error)
    }
    
    func fileNotFoundError() -> NSError {
        let errorMessage = "\(plistToReadFrom!).plist file doesn't exist in app bundle"
        
        let userInfo = [NSLocalizedDescriptionKey: errorMessage]
        
        return NSError(domain: MenuItemsPlistReaderErrorDomain,
                        code: MenuItemPlistReaderErrorCode.FileNotFound.rawValue,
                        userInfo: userInfo)
    }
}
