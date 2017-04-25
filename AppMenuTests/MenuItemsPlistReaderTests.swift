//
//  MenuItemsPlistReaderTests.swift
//  AppMenu
//
//  Created by Pyryaev Stepan on 25/04/2017.
//  Copyright © 2017 stp. All rights reserved.
//

import XCTest

class MenuItemsPlistReaderTests: XCTestCase {
    func testErrorIsReturnedWhenFileDoesnNotExist() {
        let plistReader = MenuItemsPlistReader()
        plistReader.plistToReadFrom = "notFound"
        
        let (metadata, error) = plistReader.readMenuItems();
        XCTAssertNotNil(error, "Error is returned when plist doesn't exist")
    }
    
    func testCorrectErrorDomainIsReturnedWhenPlistDoesNotExist() {
        let plistReader = MenuItemsPlistReader()
        plistReader.plistToReadFrom = "notFound"
        
        let (metadata, error) = plistReader.readMenuItems()
        let errorDomain = error?.domain
        
        XCTAssertEqual(errorDomain!,
                       MenuItemsPlistReaderErrorDomain,
                       "Correct error domain is returned")
    }
    
    func testFileNotFoundErrorCodeIsReturnedWhenPlistDoesNotExist() {
        let plistReader = MenuItemsPlistReader()
        plistReader.plistToReadFrom = "notFound"
        
        let (metadata, error) = plistReader.readMenuItems()
        let errorCode = error?.code
        
        XCTAssertEqual(errorCode!,
                       MenuItemPlistReaderErrorCode.FileNotFound.rawValue,
                       "Correct error code is returned")
        
    }
    
    func testCorrectErrorDescriptionIsReturnedWhenPlistDoesNotExist() {
        let plistReader = MenuItemsPlistReader()
        plistReader.plistToReadFrom = "notFound"
        
        let (metadata, error) = plistReader.readMenuItems()
        let userInfo = error?.userInfo
        let description: String = userInfo![NSLocalizedDescriptionKey] as! String
        
        XCTAssertEqual(description,
                       "notFound.plist file doesn't exist in app bundle",
                       "Correct error description is returned")
        
    }
}
