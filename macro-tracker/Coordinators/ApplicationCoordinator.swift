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
    
    //Welcome Flow
    private var firstPageViewController: FirstPageViewController?
    private var secondPageViewController: SecondPageViewController?
    private var thirdPageViewController: ThirdPageViewController?
    
    // Main Flow
    private var mainViewController: MainViewController?
    
    
    init(_ navigationController: UINavigationController) {
        navigationController.setNavigationBarHidden(true, animated: false)
        self.navigationController = navigationController
    }
    
    func start() {
        // TODO: Add core data logic so welcome flow only occurs on first app use
        showMain()
        if true { showWelcome() }
    }
    
    func showMain() {
        let mainViewController = MainViewController()
        mainViewController.delegate = self
        self.mainViewController = mainViewController
        navigationController.pushViewController(mainViewController, animated: false)
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
        showMain()
    }
}

extension ApplicationCoordinator: MainViewControllerDelegate {
    
}
