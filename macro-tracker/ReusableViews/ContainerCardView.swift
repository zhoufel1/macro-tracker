//
//  ContainerCardView.swift
//  macro-tracker
//
//  Created by Felix on 2020-03-15.
//  Copyright © 2020 Felix. All rights reserved.
//

import UIKit

class ContainerCardView: UIView {
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        enableRoundedCorners()
        enableShadow()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
