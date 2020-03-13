//
//  MTLabel.swift
//  macro-tracker
//
//  Created by Felix on 2020-03-13.
//  Copyright © 2020 Felix. All rights reserved.
//

import UIKit

class MTLabel: UILabel {
    init() {
        super.init(frame: .zero)
        textColor = .black
        translatesAutoresizingMaskIntoConstraints = false 
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
