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
        let image = UIImage(named: "settings")
        let selectedImage = UIImage(named: "settings")
        tabBarItem = UITabBarItem(title: "", image: image, selectedImage: selectedImage)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupView() {}
    
    func setupConstraints() {}
    
}
