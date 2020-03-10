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
        let image = UIImage(named: "person.black")
        let selectedImage = UIImage(named: "person.black")
        tabBarItem = UITabBarItem(title: "", image: image, selectedImage: selectedImage)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
    }
    
    func setupConstraints() {
    }
    
}
