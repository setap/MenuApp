//
//  MenuTabelDataSource.swift
//  AppMenu
//
//  Created by Pyryaev Stepan on 27/04/2017.
//  Copyright © 2017 stp. All rights reserved.
//

import Foundation
import UIKit

protocol MenuTableDataSource : UITableViewDataSource {
    func setMenuItems(menuItems: [MenuItem])
}
