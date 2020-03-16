//
//  MTTabBarViewController.swift
//  macro-tracker
//
//  Created by Felix on 2020-03-10.
//  Copyright © 2020 Felix. All rights reserved.
//

import UIKit

class MTTabBarViewController: UITabBarController {
    
    init(viewControllers: [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        self.viewControllers = viewControllers
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.barTintColor = Constants.secondaryColor
        tabBar.tintColor = .red
        tabBar.unselectedItemTintColor = .white
    }
}
