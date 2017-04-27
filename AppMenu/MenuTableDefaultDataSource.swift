//
//  MenuTableDefaultDataSource.swift
//  AppMenu
//
//  Created by Pyryaev Stepan on 27/04/2017.
//  Copyright © 2017 stp. All rights reserved.
//

import Foundation
import UIKit

class MenuTableDefaultDataSource: NSObject, MenuTableDataSource {
    var menuItems: [MenuItem]?
    
    func setMenuItems(menuItems: [MenuItem]) {
        self.menuItems = menuItems
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return menuItems!.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let menuItem = menuItems?[indexPath.row]
        
        cell.textLabel?.text = menuItem?.title
        cell.detailTextLabel?.text = menuItem?.subTitle
        cell.imageView?.image = UIImage(named: menuItem?.iconName!)
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
