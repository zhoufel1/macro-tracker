//
//  SettingsViewController.swift
//  macro-tracker
//
//  Created by Felix on 2020-03-10.
//  Copyright © 2020 Felix. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {}

class SettingsViewController: UIViewController {
    
    weak var delegate: SettingsViewControllerDelegate?
    
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Settings"
        let image = UIImage(named: "gear")
        let selectedImage = UIImage(named: "gear")
        tabBarItem = UITabBarItem(title: "Settings", image: image, selectedImage: selectedImage)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupView() {}
    
    func setupConstraints() {}
    
}
