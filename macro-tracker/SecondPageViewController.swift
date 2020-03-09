//
//  SecondPageViewController.swift
//  macro-tracker
//
//  Created by Felix on 2020-03-08.
//  Copyright © 2020 Felix. All rights reserved.
//

import UIKit

protocol SecondPageViewControllerDelegate: AnyObject {
    
}

class SecondPageViewController: UIViewController {
    
    weak var delegate: SecondPageViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue 
    }
}
