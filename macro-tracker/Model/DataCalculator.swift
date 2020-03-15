//
//  DataCalculator.swift
//  macro-tracker
//
//  Created by Felix on 2020-03-13.
//  Copyright © 2020 Felix. All rights reserved.
//

import Foundation

struct DataCalculator {
    /**
     Calculates Basal Metabolic Rate based on Mifflin St Jeor Equation.
     */
    static func calculateBMR(sex: Sex, mass: Double, height: Double, age: Int) -> Double {
        var result = 10.0 * mass + 6.25 * height - 5.0 * Double(age)
        switch sex {
        case .male:
            result += 5
        case .female:
            result += -161
        }
        return result
    }
    
    static func calculateBMI(mass: Double, height: Double) -> Double {
        return (mass / pow(height/100, 2)).truncate(places: 1)
    }
    
    static func calculateWaterConsumption(mass: Double, activityLevel: ActivityLevel) -> Int {
        var result = ((mass * 2.20462) / 2) * 29.5735
        switch activityLevel {
        case .moderate, .high:
            result += 250
        case .veryHigh, .hyperactive :
            result += 500
        default:
            break
        }
        return Int(result)
    }
}
