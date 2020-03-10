//
//  ApplicationCoordinator.swift
//  macro-tracker
//
//  Created by Felix on 2020-03-08.
//  Copyright © 2020 Felix. All rights reserved.
//

import Foundation
import UIKit

class ApplicationCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    private let navigationController: UINavigationController
    
    init(_ navigationController: UINavigationController) {
        navigationController.setNavigationBarHidden(true, animated: false)
        self.navigationController = navigationController
    }
    
    func start() {
        let alreadyLaunched = UserDefaults.standard.bool(forKey: "alreadyLaunched")
        showMain()
        if !alreadyLaunched {
            showWelcome()
        }
    }
    
    func showMain() {
        let mainCoordinator = MainCoordinator(navigationController)
        childCoordinators.append(mainCoordinator)
        mainCoordinator.start()
    }
    
    func showWelcome() {
        let welcomeCoordinator = WelcomeCoordinator(navigationController)
        welcomeCoordinator.delegate = self
        childCoordinators.append(welcomeCoordinator)
        welcomeCoordinator.start()
    }
    
}

extension ApplicationCoordinator: BackToMainViewControllerDelegate {
    func navigateToMainFlow() {
        navigationController.popViewController(animated: false)
        childCoordinators.removeLast()
    }
}
