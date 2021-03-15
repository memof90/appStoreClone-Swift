//
//  BaseTabBarController.swift
//  AppStoreJsonClone
//
//  Created by Memo Figueredo on 15/3/21.
//

import UIKit

class BaseTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let redViewController = UIViewController()
        redViewController.view.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        redViewController.tabBarItem.title = "Red"
        
        
        
        let blueViewController = UIViewController()
        blueViewController.view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        blueViewController.tabBarItem.title = "Blue"
        
        
        viewControllers = [
            redViewController,
            blueViewController,
        ]
    }
}
