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
        redViewController.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        redViewController.navigationItem.title = "Apps"
        
        
        let redNavController = UINavigationController(rootViewController: redViewController)
        redNavController.tabBarItem.title = "Apps"
        redNavController.navigationBar.prefersLargeTitles = true
        redNavController.tabBarItem.image = #imageLiteral(resourceName: "apps")
        
        let blueViewController = UIViewController()
        blueViewController.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        blueViewController.navigationItem.title = "Search"
        
        let blueNavController = UINavigationController(rootViewController: blueViewController)
        blueNavController.tabBarItem.title = "Search"
        blueNavController.navigationBar.prefersLargeTitles = true
        blueNavController.tabBarItem.image = UIImage(named: "search")
        
//        MARK: CHANGE COLOR TABBAR
//        tabBar.barTintColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        
//        MARK: CHANGE COLOR ICON TABBAR
//        tabBar.tintColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
       
         
        viewControllers = [
            redNavController,
            blueNavController,
        ]
    }
}
