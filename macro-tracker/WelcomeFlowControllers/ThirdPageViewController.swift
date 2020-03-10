//
//  ThirdPageViewController.swift
//  macro-tracker
//
//  Created by Felix on 2020-03-09.
//  Copyright © 2020 Felix. All rights reserved.
//

import UIKit

protocol ThirdPageViewControllerDelegate: AnyObject {
    
}

class ThirdPageViewController: UIViewController {
    
    weak var delegate: ThirdPageViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
    }

}
