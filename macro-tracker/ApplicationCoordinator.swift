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
    
    // Main Flow
    private var mainViewController: MainViewController?
    
    
    init(_ navigationController: UINavigationController) {
        navigationController.setNavigationBarHidden(true, animated: false)
        self.navigationController = navigationController
    }
    
    func start() {
        showMain()
    }
    
    func showMain() {
        let mainViewController = MainViewController()
        mainViewController.delegate = self
        navigationController.pushViewController(mainViewController, animated: false)
    }
}

extension ApplicationCoordinator: MainViewControllerDelegate {
    
}
