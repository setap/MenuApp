//
//  MenuItemsReader.swift
//  AppMenu
//
//  Created by Pyryaev Stepan on 25/04/2017.
//  Copyright © 2017 stp. All rights reserved.
//

import Foundation

protocol MenuItemsReader {
    func readMenuItems() -> ([[String: String]]?, NSError?)
}
