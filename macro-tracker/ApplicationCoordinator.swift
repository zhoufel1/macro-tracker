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
    
    private let navigationController: UINavigationController
    
    //Welcome Flow
    private var firstPageViewController: FirstPageViewController?
    private var secondPageViewController: SecondPageViewController?
    
    // Main Flow
    private var mainViewController: MainViewController?
    
    
    init(_ navigationController: UINavigationController) {
        navigationController.setNavigationBarHidden(true, animated: false)
        self.navigationController = navigationController
    }
    
    func start() {
        showWelcome()
    }
    
    func showMain() {
        let mainViewController = MainViewController()
        mainViewController.delegate = self
        self.mainViewController = mainViewController
        navigationController.pushViewController(mainViewController, animated: false)
    }
    
    func showWelcome() {
        let firstPageViewController = FirstPageViewController()
        firstPageViewController.delegate = self
        self.firstPageViewController = firstPageViewController
        
        let secondPageViewController = SecondPageViewController()
        secondPageViewController.delegate = self
        self.secondPageViewController = secondPageViewController
        
        // TODO create page view controller
        let pageViewController = PageViewController(pages: [firstPageViewController, secondPageViewController])
        navigationController.pushViewController(pageViewController, animated: false)
    }
}

extension ApplicationCoordinator: MainViewControllerDelegate {
    
}

extension ApplicationCoordinator: FirstPageViewControllerDelegate {
    
}

extension ApplicationCoordinator: SecondPageViewControllerDelegate {
    
}
