//
//  FirstPageViewController.swift
//  macro-tracker
//
//  Created by Felix on 2020-03-08.
//  Copyright © 2020 Felix. All rights reserved.
//

import UIKit

protocol FirstPageViewControllerDelegate: AnyObject {
    
}

class FirstPageViewController: UIViewController {
    
    weak var delegate: FirstPageViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
    
}
