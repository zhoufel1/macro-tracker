//
//  Double+Extensions.swift
//  macro-tracker
//
//  Created by Felix on 2020-03-13.
//  Copyright © 2020 Felix. All rights reserved.
//

import Foundation

extension Double {
    func truncate(places : Int)-> Double
    {
        return Double(floor(pow(10.0, Double(places)) * self)/pow(10.0, Double(places)))
    }
}
