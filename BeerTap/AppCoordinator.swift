//
//  AppCoordinator.swift
//  BeerTap
//
//  Created by Alina Ene on 22/04/2020.
//  Copyright © 2020 Alina Ene. All rights reserved.
//

import UIKit

class AppCoordinator {
    
    lazy var mainNavController: UINavigationController = {
           
           let navController = UINavigationController()
           navController.navigationBar.isTranslucent = true
           navController.navigationBar.setBackgroundImage(UIImage(), for: .default)
           navController.navigationBar.shadowImage = UIImage()
           navController.navigationBar.tintColor = .white
           navController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemPurple, NSAttributedString.Key.font: UIFont(name: "MarkerFelt-Thin", size: 20) ?? UIFont.systemFont(ofSize: 20)]
           return navController
       }()
}
