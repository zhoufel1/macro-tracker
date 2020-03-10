//
//  FourthPageViewController.swift
//  macro-tracker
//
//  Created by Felix on 2020-03-09.
//  Copyright © 2020 Felix. All rights reserved.
//

import UIKit

protocol FourthPageViewControllerDelegate: AnyObject {
    func userPressedGetStarted()
}

class FourthPageViewController: UIViewController {
    
    weak var delegate: FourthPageViewControllerDelegate?
    
    private let getStartedButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    func setupView() {
        getStartedButton.setTitle("Get Started!", for: .normal)
        getStartedButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        getStartedButton.setTitleColor(.black, for: .normal)
        getStartedButton.translatesAutoresizingMaskIntoConstraints = false
        getStartedButton.addTarget(self, action: #selector(getStartedHandler), for: .touchUpInside)
        view.addSubview(getStartedButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            getStartedButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            getStartedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func getStartedHandler() {
        delegate?.userPressedGetStarted()
    }
    
}
