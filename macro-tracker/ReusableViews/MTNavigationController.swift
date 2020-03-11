//
//  MTNavigationController.swift
//  macro-tracker
//
//  Created by Felix on 2020-03-10.
//  Copyright © 2020 Felix. All rights reserved.
//

import UIKit

class MTNavigationController: UINavigationController {
    override func viewDidLoad() {
        navigationBar.isTranslucent = false
        view.backgroundColor = .white
        navigationBar.barTintColor = .red
    }
}
