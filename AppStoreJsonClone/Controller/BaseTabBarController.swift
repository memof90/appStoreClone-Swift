//
//  BaseTabBarController.swift
//  AppStoreJsonClone
//
//  Created by Memo Figueredo on 15/3/21.
//

import UIKit

class BaseTabBarController: UITabBarController {
    

//    2-refactor out repeated logic of viewDidLoad
//    3-maybe introduce our AppSearchController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        MARK: FIRST CONTROLLER
//        let todayController = UIViewController()
//        todayController.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        todayController.navigationItem.title = "Today"
//        
//        
//        let todayNavController = UINavigationController(rootViewController: todayController)
//        todayNavController.tabBarItem.title = "Today"
//        todayNavController.tabBarItem.image = #imageLiteral(resourceName: "today_icon")
//        todayNavController.navigationBar.prefersLargeTitles = true
        
//        MARK: SECOND CONTROLLER
        
//        let redViewController = UIViewController()
//        redViewController.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        redViewController.navigationItem.title = "Apps"
//
//
//        let redNavController = UINavigationController(rootViewController: redViewController)
//        redNavController.tabBarItem.title = "Apps"
//        redNavController.tabBarItem.image = #imageLiteral(resourceName: "apps")
//        redNavController.navigationBar.prefersLargeTitles = true
        
//        MARK: TREE CONTROLLER
        
//        let blueViewController = UIViewController()
//        blueViewController.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        blueViewController.navigationItem.title = "Search"
//
//        let blueNavController = UINavigationController(rootViewController: blueViewController)
//        blueNavController.tabBarItem.title = "Search"
//        blueNavController.navigationBar.prefersLargeTitles = true
//        blueNavController.tabBarItem.image = UIImage(named: "search")
        
//        MARK: CHANGE COLOR TABBAR
//        tabBar.barTintColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        
//        MARK: CHANGE COLOR ICON TABBAR
//        tabBar.tintColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
       
         
        viewControllers = [
            createNavController(viewController: AppsSearchController(), title: "Search", imageName: "search", tilteLarge: true),
            createNavController(viewController: AppsController( ), title: "Apps", imageName: "apps", tilteLarge: true),
            createNavController(viewController: UIViewController(), title: "Today", imageName: "today_icon", tilteLarge: true),
//            First solution
//            createNavController(viewController: AppsSearchController(collectionViewLayout: UICollectionViewFlowLayout()), title: "Search", imageName: "search", tilteLarge: true)
//            second solution
//            createNavController(viewController: AppsSearchController(), title: "Search", imageName: "search", tilteLarge: true)
        ]
    }
    
//    Fuctions to create NavControllers
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String, tilteLarge: Bool) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = tilteLarge
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        
        
        return navController
    }
}
