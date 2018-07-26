//
//  MainTabBarController.swift
//  lab1_tumblr
//
//  Created by Mike Chu on 7/25/18.
//  Copyright © 2018 Paolo Martinez. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.tumblrBlue()
        setupViewControllers()
    }
    
    func setupViewControllers() {
        
        let homeNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "home_unselected"), selectedImage: #imageLiteral(resourceName: "home_selected"), rootViewController: HomeFeedController())
        let searchNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "search_unselected"), selectedImage: #imageLiteral(resourceName: "search_selected"))
        let composeNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "plus_unselected"), selectedImage: #imageLiteral(resourceName: "plus_unselected"))
        let messageNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "message-icon"), selectedImage: #imageLiteral(resourceName: "message-icon"))
        let profileNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "profile-Icon"), selectedImage: #imageLiteral(resourceName: "profile-Icon"))
        
        viewControllers = [homeNavController, searchNavController, composeNavController, messageNavController, profileNavController]
        
        tabBar.tintColor = .white
        tabBar.barTintColor = UIColor.rgb(red: 42, green: 66, blue: 89)
        
        guard let items = tabBar.items else { return }
        for item in items {
            item.imageInsets = UIEdgeInsetsMake(4, 0, -4, 0)
        }
    }

    
    
    fileprivate func templateNavController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController:  UIViewController = UIViewController()) -> UINavigationController {
        let viewController = rootViewController
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = unselectedImage
        navController.tabBarItem.selectedImage = selectedImage
        return navController
    }
}
