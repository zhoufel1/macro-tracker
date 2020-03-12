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
    private var macroDataViewController: MacroDataViewController?
    private var settingsViewController: SettingsViewController?
    
    private var profileNavigationController: MTNavigationController?
    private var macroInputNavigationController: MTNavigationController?
    private var macroDataNavigationController: MTNavigationController?
    private var settingsNavigationController: MTNavigationController?
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let profileViewController = ProfileViewController()
        profileViewController.delegate = self
        self.profileViewController = profileViewController
        let profileHolder = MTNavigationController(rootViewController: profileViewController)
        self.profileNavigationController = profileHolder
        
        let macroInputViewController = MacroInputViewController()
        macroInputViewController.delegate = self
        self.macroInputViewController = macroInputViewController
        let macroInputHolder = MTNavigationController(rootViewController: macroInputViewController)
        self.macroInputNavigationController = macroInputHolder
        
        let macroDataViewController = MacroDataViewController()
        macroDataViewController.delegate = self
        self.macroDataViewController = macroDataViewController
        let macroDataHolder = MTNavigationController(rootViewController: macroDataViewController)
        self.macroDataNavigationController = macroDataHolder
        
        let settingsViewController = SettingsViewController()
        settingsViewController.delegate = self
        self.settingsViewController = settingsViewController
        let settingsHolder = MTNavigationController(rootViewController: settingsViewController)
        self.settingsNavigationController = settingsHolder
        
        let controllers = [profileHolder, macroInputHolder, macroDataHolder, settingsHolder]
        let tabBarController = MTTabBarViewController(viewControllers: controllers)
        tabBarController.selectedIndex = 0
        navigationController.pushViewController(tabBarController, animated: false)
    }
    
}

extension MainCoordinator: ProfileViewControllerDelegate {}

extension MainCoordinator: MacroInputViewControllerDelegate {}

extension MainCoordinator: MacroDataViewControllerDelegate {}

extension MainCoordinator: SettingsViewControllerDelegate {}
