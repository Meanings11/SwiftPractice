//
//  BaseTabBarController.swift
//  CodeAutoLayout
//
//  Created by 李名夫 on 6/5/19.
//  Copyright © 2019 李名夫. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       viewControllers = [
            createNavController(viewController: AppSearchController(), title: "搜索", image: #imageLiteral(resourceName: "outline_search_black_18dp.png")),
            createNavController(viewController: UIViewController(), title: "今日", image: #imageLiteral(resourceName: "baseline_today_black_18dp.png")),
            createNavController(viewController: UIViewController(), title: "应用", image: #imageLiteral(resourceName: "baseline_apps_black_18dp.png"))
        ]
    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .white
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        return navController
    }
}
