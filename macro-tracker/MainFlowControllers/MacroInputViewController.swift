//
//  MacroInputViewController.swift
//  macro-tracker
//
//  Created by Felix on 2020-03-10.
//  Copyright © 2020 Felix. All rights reserved.
//

import UIKit

protocol MacroInputViewControllerDelegate: AnyObject {}

class MacroInputViewController: UIViewController {
    
    weak var delegate: MacroInputViewControllerDelegate?
    
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Macros"
        let image = UIImage(named: "plus.square")
        let selectedImage = UIImage(named: "plus.square")
        tabBarItem = UITabBarItem(title: "Add", image: image, selectedImage: selectedImage)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    func setupView() {
    }
    
    func setupConstraints() {
    }
}
