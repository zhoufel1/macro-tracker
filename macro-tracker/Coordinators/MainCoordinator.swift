//
//  MainCoordinator.swift
//  macro-tracker
//
//  Created by Felix on 2020-03-10.
//  Copyright © 2020 Felix. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    private let navigationController: UINavigationController
    
    private var profileViewController: ProfileViewController?
    private var macroInputViewController: MacroInputViewController?
    
    private var profileNavigationController: NavigationController?
    private var macroInputNavigationController: NavigationController?
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let profileViewController = ProfileViewController()
        profileViewController.delegate = self
        self.profileViewController = profileViewController
        let profileHolder = NavigationController(rootViewController: profileViewController)
        self.profileNavigationController = profileHolder
        
        let macroInputViewController = MacroInputViewController()
        macroInputViewController.delegate = self
        self.macroInputViewController = macroInputViewController
        let macroInputHolder = NavigationController(rootViewController: macroInputViewController)
        self.macroInputNavigationController = macroInputHolder
        
        let controllers = [profileHolder, macroInputHolder]
        let tabBarController = TabBarViewController(viewControllers: controllers)
        tabBarController.selectedIndex = 0
        navigationController.pushViewController(tabBarController, animated: false)
    }
    
}

extension MainCoordinator: ProfileViewControllerDelegate {}

extension MainCoordinator: MacroInputViewControllerDelegate {}
