//
//  DataObjects.swift
//  macro-tracker
//
//  Created by Felix on 2020-03-13.
//  Copyright © 2020 Felix. All rights reserved.
//

import Foundation

enum Sex: Int, CustomStringConvertible {
    case male
    case female
    
    var description: String {
        switch self {
        case .male:
            return "Male"
        case .female:
            return "Female"
        }
    }
}

enum ActivityLevel: Int, CustomStringConvertible {
    case low
    case moderate
    case high
    case veryHigh
    case hyperactive
    
    var description: String {
         switch self {
         case .low:
             return "Low"
         case .moderate:
             return "Moderate"
         case .high:
             return "High"
         case .veryHigh:
             return "Very High"
         case .hyperactive:
             return "Hyperactive"
         }
     }
}

enum Goal: Int, CustomStringConvertible {
    case lose
    case maintain
    case increase
    
    var description: String {
        switch self {
        case .lose:
            return "Lose Weight"
        case .maintain:
            return "Maintain Weight"
        case .increase:
            return "Increase Weight"
        }
    }
}
