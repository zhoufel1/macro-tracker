//
//  MainViewController.swift
//  macro-tracker
//
//  Created by Felix on 2020-03-08.
//  Copyright © 2020 Felix. All rights reserved.
//

import UIKit

protocol MainViewControllerDelegate: AnyObject {
    
}

class MainViewController: UIViewController {
    
    weak var delegate: MainViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .red
    }
    

}
