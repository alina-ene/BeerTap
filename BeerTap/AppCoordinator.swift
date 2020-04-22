//
//  AppCoordinator.swift
//  BeerTap
//
//  Created by Alina Ene on 22/04/2020.
//  Copyright © 2020 Alina Ene. All rights reserved.
//

import UIKit

class AppCoordinator {
    private let queryManager = QueryManager()
    lazy var mainNavController: UINavigationController = {
        
        let navController = UINavigationController()
        navController.navigationBar.isTranslucent = true
        navController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navController.navigationBar.shadowImage = UIImage()
        navController.navigationBar.tintColor = .white
        navController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 0.7215686275, blue: 0.5607843137, alpha: 1), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25)]
        return navController
    }()
    
    private lazy var listVC: ListViewController = {
        let vc = ListViewController.instantiate()
        vc.presenter = ListViewPresenter(queryManager: queryManager)
        vc.presenter.coordinator = self
        return vc
    }()
    
    func start() {
        
        mainNavController.pushViewController(listVC, animated: false)
    }
    
    func reloadList() {
        
    }
    
    func updateStateFeedback() {
        listVC.updateStateFeedback()
    }
}
