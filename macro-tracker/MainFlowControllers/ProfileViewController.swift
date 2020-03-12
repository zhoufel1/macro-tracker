//
//  ProfileViewController.swift
//  macro-tracker
//
//  Created by Felix on 2020-03-10.
//  Copyright © 2020 Felix. All rights reserved.
//

import UIKit

protocol ProfileViewControllerDelegate: AnyObject {
    
}

class ProfileViewController: UIViewController {
    
    weak var delegate: ProfileViewControllerDelegate?
    
    private let scrollView = UIScrollView()
    private let resultsLabel = UILabel()
    private let resultsView = UIView()
    private let bodyInfoLabel = UILabel()
    private let editTableAction = UIButton()
    private let bodyInfoTable = UITableView()
 
    
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Profile"
        let image = UIImage(named: "person.ios")
        let selectedImage = UIImage(named: "person.ios")
        tabBarItem = UITabBarItem(title: "Profile", image: image, selectedImage: selectedImage)
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
        scrollView.delegate = self
        scrollView.alwaysBounceVertical = true
        scrollView.backgroundColor = .clear
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        resultsLabel.text = "Calculated Results"
        resultsLabel.font = UIFont.systemFont(ofSize: 20)
        resultsLabel.textColor = .black
        resultsLabel.textAlignment = .center
        resultsLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(resultsLabel)
        
        resultsView.backgroundColor = .white
        resultsView.layer.cornerRadius = 15.0
        resultsView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(resultsView)

        bodyInfoLabel.text = "User Information"
        bodyInfoLabel.font = UIFont.systemFont(ofSize: 20)
        bodyInfoLabel.textColor = .black
        bodyInfoLabel.textAlignment = .center
        bodyInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(bodyInfoLabel)
        
        // TODO: Add action to edit table
        editTableAction.setImage(UIImage(named: "edit"), for: .normal)
        editTableAction.tintColor = .black
        editTableAction.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(editTableAction)
        
        bodyInfoTable.backgroundColor = .white
        bodyInfoTable.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(bodyInfoTable)

    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            resultsLabel.topAnchor.constraint(equalTo: scrollView.topAnchor),
            resultsLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.profileSidePadding),
            
            resultsView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            resultsView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95),
            resultsView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.25),
            resultsView.topAnchor.constraint(equalTo: resultsLabel.bottomAnchor, constant: 10),

            bodyInfoLabel.topAnchor.constraint(equalTo: resultsView.bottomAnchor, constant: 30),
            bodyInfoLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.profileSidePadding),
            
            editTableAction.topAnchor.constraint(equalTo: resultsView.bottomAnchor, constant: 30),
            editTableAction.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Constants.profileSidePadding),

            bodyInfoTable.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            bodyInfoTable.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            bodyInfoTable.topAnchor.constraint(equalTo: bodyInfoLabel.bottomAnchor, constant: 10),
            bodyInfoTable.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.5),
        ])
    }
    
}

extension ProfileViewController: UIScrollViewDelegate {}
