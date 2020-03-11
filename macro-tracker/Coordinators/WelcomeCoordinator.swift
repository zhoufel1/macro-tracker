//
//  WelcomeCoordinator.swift
//  macro-tracker
//
//  Created by Felix on 2020-03-09.
//  Copyright © 2020 Felix. All rights reserved.
//

import UIKit

protocol BackToMainViewControllerDelegate: AnyObject {
    func navigateToMainFlow()
}

class WelcomeCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    private let navigationController: UINavigationController
    
    weak var delegate: BackToMainViewControllerDelegate?
    
    private var firstPageViewController: FirstPageViewController?
    private var secondPageViewController: SecondPageViewController?
    private var thirdPageViewController: ThirdPageViewController?
    private var fourthPageViewController: FourthPageViewController?
    private var pageViewController: MTPageViewController?
    
    init(_ navigationController: UINavigationController) {
        navigationController.setNavigationBarHidden(true, animated: false)
        self.navigationController = navigationController
    }
    
    func start() {
        let firstPageViewController = FirstPageViewController()
        firstPageViewController.delegate = self
        self.firstPageViewController = firstPageViewController
        
        let secondPageViewController = SecondPageViewController()
        secondPageViewController.delegate = self
        self.secondPageViewController = secondPageViewController
        
        let thirdPageViewController = ThirdPageViewController()
        thirdPageViewController.delegate = self
        self.thirdPageViewController = thirdPageViewController
        
        let fourthPageViewController = FourthPageViewController()
        fourthPageViewController.delegate = self
        self.fourthPageViewController = fourthPageViewController
        
        let pageViewController = MTPageViewController(pages: [firstPageViewController,
                                                            secondPageViewController,
                                                            thirdPageViewController,
                                                            fourthPageViewController])
        self.pageViewController = pageViewController
        navigationController.pushViewController(pageViewController, animated: false)
    }
    
}

extension WelcomeCoordinator: FirstPageViewControllerDelegate {
    func goToSecondPage() {
        if let secondPage = pageViewController?.pages[1] {
            pageViewController?.setViewControllers([secondPage], direction: .forward, animated: true, completion: nil)
        }
    }
}

extension WelcomeCoordinator: SecondPageViewControllerDelegate {}

extension WelcomeCoordinator: ThirdPageViewControllerDelegate {}

extension WelcomeCoordinator: FourthPageViewControllerDelegate {
    func userPressedGetStarted() {
        UserDefaults.standard.set(true, forKey: "alreadyLaunched")
        delegate?.navigateToMainFlow()
    }
}
