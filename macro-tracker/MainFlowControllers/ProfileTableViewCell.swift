//
//  ProfileTableViewCell.swift
//  macro-tracker
//
//  Created by Felix on 2020-03-13.
//  Copyright © 2020 Felix. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    internal let titleLabel = MTLabel()
    internal let infoLabel = MTLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(titleLabel)
        addSubview(infoLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            infoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            infoLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
