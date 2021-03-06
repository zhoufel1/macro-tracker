//
//  ProfileViewController.swift
//  macro-tracker
//
//  Created by Felix on 2020-03-10.
//  Copyright © 2020 Felix. All rights reserved.
//

import UIKit
import CoreData

protocol ProfileViewControllerDelegate: AnyObject {
    func showProfileEdit()
}

class ProfileViewController: UIViewController {
    
    weak var delegate: ProfileViewControllerDelegate?
    private let viewModel = ProfileViewModel()
    
    private let scrollView = UIScrollView()
    
    private let resultsLabel = MTLabel()
    private let bodyInfoLabel = MTLabel()
    
    private let editTableAction = UIButton()
    
    private var bmrIcon = UIImageView(image: UIImage(named: "fire"))
    private let bmrValue = MTLabel()
    private let bmrLabel = MTLabel()
    
    private let bmiIcon = UIImageView(image: UIImage(named: "bmi"))
    private let bmiValue = MTLabel()
    private let bmiLabel = MTLabel()
    
    private let waterIcon = UIImageView(image: UIImage(named: "water"))
    private let waterValue = MTLabel()
    private let waterLabel = MTLabel()
    
    private let resultsView = ContainerCardView()
    private let bodyInfoTableContainer = ContainerCardView()
    private let bodyInfoTable = UITableView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Profile"
        let icon = UIImage(named: "person.ios")
        tabBarItem = UITabBarItem(title: "Profile", image: icon, selectedImage: icon)
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
        scrollView.contentSize.height = 700
        scrollView.alwaysBounceVertical = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = .clear
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        resultsLabel.text = "Calculated Results"
        resultsLabel.font = UIFont.systemFont(ofSize: 25)
        resultsLabel.textAlignment = .center
        scrollView.addSubview(resultsLabel)
        
        resultsView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(resultsView)
        
        bmrValue.text = viewModel.getBMRAsString()
        bmrValue.textColor = .black
        bmrValue.font = UIFont.systemFont(ofSize: 25)
        bmrValue.translatesAutoresizingMaskIntoConstraints = false
        resultsView.addSubview(bmrValue)
    
        bmrLabel.text = "Basal Metabolic Rate"
        bmrLabel.font = UIFont.systemFont(ofSize: 15)
        resultsView.addSubview(bmrLabel)
        
        bmrIcon.translatesAutoresizingMaskIntoConstraints = false
        resultsView.addSubview(bmrIcon)
        
        bmiValue.text = viewModel.getBMIAsString()
        bmiValue.font = UIFont.systemFont(ofSize: 25)
        resultsView.addSubview(bmiValue)
        
        bmiLabel.text = "Body Mass Index"
        bmiLabel.font = UIFont.systemFont(ofSize: 15)
        resultsView.addSubview(bmiLabel)
        
        bmiIcon.translatesAutoresizingMaskIntoConstraints = false
        resultsView.addSubview(bmiIcon)
        
        waterValue.text = viewModel.getWaterRequirementAsString()
        waterValue.font = UIFont.systemFont(ofSize: 25)
        resultsView.addSubview(waterValue)
        
        waterLabel.text = "Daily Water Requirement"
        waterLabel.font = UIFont.systemFont(ofSize: 15)
        resultsView.addSubview(waterLabel)
        
        waterIcon.translatesAutoresizingMaskIntoConstraints = false
        resultsView.addSubview(waterIcon)

        bodyInfoLabel.text = "User Information"
        bodyInfoLabel.font = UIFont.systemFont(ofSize: 25)
        bodyInfoLabel.textAlignment = .center
        scrollView.addSubview(bodyInfoLabel)
        
        editTableAction.addTarget(self, action: #selector(showEditAction), for: .touchUpInside)
        editTableAction.setImage(UIImage(named: "edit"), for: .normal)
        editTableAction.tintColor = .black
        editTableAction.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(editTableAction)

        bodyInfoTableContainer.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(bodyInfoTableContainer)
        
        bodyInfoTable.enableRoundedCorners()
        bodyInfoTable.delegate = self
        bodyInfoTable.dataSource = self
        bodyInfoTable.backgroundColor = .white
        bodyInfoTable.isScrollEnabled = false
        bodyInfoTable.allowsSelection = false
        bodyInfoTable.register(ProfileTableViewCell.self, forCellReuseIdentifier: "cell")
        bodyInfoTable.translatesAutoresizingMaskIntoConstraints = false
        bodyInfoTableContainer.addSubview(bodyInfoTable)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            
            resultsLabel.topAnchor.constraint(equalTo: scrollView.topAnchor),
            resultsLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.profileSidePadding),
            
            resultsView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            resultsView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.96),
            resultsView.heightAnchor.constraint(equalToConstant: 230),
            resultsView.topAnchor.constraint(equalTo: resultsLabel.bottomAnchor, constant: 10),
           
            bmrIcon.topAnchor.constraint(equalTo: resultsView.topAnchor, constant: 20),
            bmrIcon.leadingAnchor.constraint(equalTo: resultsView.leadingAnchor, constant: 30),
            
            bmrValue.centerXAnchor.constraint(equalTo: resultsView.centerXAnchor),
            bmrValue.topAnchor.constraint(equalTo: resultsView.topAnchor, constant: 20),
            
            bmrLabel.centerXAnchor.constraint(equalTo: resultsView.centerXAnchor),
            bmrLabel.topAnchor.constraint(equalTo: bmrValue.bottomAnchor),
            
            bmiIcon.topAnchor.constraint(equalTo: bmrIcon.bottomAnchor, constant: 20),
            bmiIcon.leadingAnchor.constraint(equalTo: resultsView.leadingAnchor, constant: 30),
            
            bmiValue.centerXAnchor.constraint(equalTo: resultsView.centerXAnchor),
            bmiValue.topAnchor.constraint(equalTo: bmrLabel.bottomAnchor, constant: 20),
            
            bmiLabel.centerXAnchor.constraint(equalTo: resultsView.centerXAnchor),
            bmiLabel.topAnchor.constraint(equalTo: bmiValue.bottomAnchor),
            
            waterIcon.topAnchor.constraint(equalTo: bmiIcon.bottomAnchor, constant: 20),
            waterIcon.leadingAnchor.constraint(equalTo: resultsView.leadingAnchor, constant: 30),
            
            waterValue.centerXAnchor.constraint(equalTo: resultsView.centerXAnchor),
            waterValue.topAnchor.constraint(equalTo: bmiLabel.bottomAnchor, constant: 20),
            
            waterLabel.centerXAnchor.constraint(equalTo: resultsView.centerXAnchor),
            waterLabel.topAnchor.constraint(equalTo: waterValue.bottomAnchor),
            
            bodyInfoLabel.topAnchor.constraint(equalTo: resultsView.bottomAnchor, constant: 30),
            bodyInfoLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.profileSidePadding),
            
            editTableAction.topAnchor.constraint(equalTo: resultsView.bottomAnchor, constant: 35),
            editTableAction.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Constants.profileSidePadding - 5),
            
            bodyInfoTableContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.96),
            bodyInfoTableContainer.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            bodyInfoTableContainer.topAnchor.constraint(equalTo: bodyInfoLabel.bottomAnchor, constant: 10),
            bodyInfoTableContainer.heightAnchor.constraint(equalToConstant: 299),
            
            bodyInfoTable.widthAnchor.constraint(equalTo: bodyInfoTableContainer.widthAnchor),
            bodyInfoTable.heightAnchor.constraint(equalTo: bodyInfoTableContainer.heightAnchor)
        ])
    }
    
    @objc func showEditAction() {
        delegate?.showProfileEdit()
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProfileTableViewCell
        let cellTypes = viewModel.cellTypes
        let profileData = viewModel.dataAsString
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = .black
        cell.titleLabel.text = cellTypes[indexPath.row].rawValue
        cell.infoLabel.text = profileData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
}
