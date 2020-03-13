//
//  UIView+Extensions.swift
//  macro-tracker
//
//  Created by Felix on 2020-03-13.
//  Copyright © 2020 Felix. All rights reserved.
//

import UIKit

extension UIView {
    func enableShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 6
        self.layer.shadowOffset = .zero
    }
}
