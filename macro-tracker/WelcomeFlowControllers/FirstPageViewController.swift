//
//  FirstPageViewController.swift
//  macro-tracker
//
//  Created by Felix on 2020-03-08.
//  Copyright © 2020 Felix. All rights reserved.
//

import UIKit

protocol FirstPageViewControllerDelegate: AnyObject {
    func goToSecondPage()
}

class FirstPageViewController: UIViewController {
    
    weak var delegate: FirstPageViewControllerDelegate?
    
    private let nextButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    func setupView() {
        view.backgroundColor = .white
        
        nextButton.setTitle("NEXT", for: .normal)
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        nextButton.addTarget(self, action: #selector(nextPageActionHandler), for: .touchUpInside)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nextButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50)
        ])
    }
    
    @objc func nextPageActionHandler() {
        delegate?.goToSecondPage()
    }

}
