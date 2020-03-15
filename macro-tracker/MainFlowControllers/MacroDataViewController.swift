//
//  MacroDataViewController.swift
//  macro-tracker
//
//  Created by Felix on 2020-03-10.
//  Copyright © 2020 Felix. All rights reserved.
//

import UIKit

protocol MacroDataViewControllerDelegate: AnyObject {}

class MacroDataViewController: UIViewController {
    
    weak var delegate: MacroDataViewControllerDelegate?
    
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Data"
        let image = UIImage(named: "chart.bar")
        let selectedImage = UIImage(named: "chart.bar")
        tabBarItem = UITabBarItem(title: "Data", image: image, selectedImage: selectedImage)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setupView() {}
    
    func setupConstraints() {}
}
