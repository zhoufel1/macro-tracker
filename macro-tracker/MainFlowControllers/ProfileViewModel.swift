//
//  ProfileViewModel.swift
//  macro-tracker
//
//  Created by Felix on 2020-03-14.
//  Copyright © 2020 Felix. All rights reserved.
//

import Foundation

class ProfileViewModel {
    let cellTypes: [ProfileCell] = [
        .height,
        .weight,
        .age,
        .sex,
        .goal,
        .activity
    ]
    
    var profileData: (height: Double, weight: Double, age: Int, sex: Sex, goal: Goal, activity: ActivityLevel) {
        let fetchedDataObject = ProfileDatabaseHandler()!.retrieveProfileData()!
        return (
            fetchedDataObject.height,
            fetchedDataObject.weight,
            Int(fetchedDataObject.age),
            Sex(rawValue: Int(fetchedDataObject.sex))!,
            Goal(rawValue: Int(fetchedDataObject.goal))!,
            ActivityLevel(rawValue: Int(fetchedDataObject.activityLevel))!
        )
    }
    var dataAsString: [String] {
        [
            String(profileData.height),
            String(profileData.weight),
            String(profileData.age),
            String(describing: profileData.sex),
            String(describing: profileData.goal),
            String(describing: profileData.activity)
        ]
    }
    
    func getBMRAsString() -> String {
        return "\(DataCalculator.calculateBMR(sex: profileData.sex, mass: profileData.weight, height: profileData.height, age: profileData.age)) kCal"
    }
    
    func getBMIAsString() -> String {
        return "\(DataCalculator.calculateBMI(mass: profileData.weight, height: profileData.height))"
    }
    
    func getWaterRequirementAsString() -> String {
        return "\(DataCalculator.calculateWaterConsumption(mass: profileData.weight, activityLevel: profileData.activity)) mL"
    }
}

enum ProfileCell: String {
    case height = "Height (cm)"
    case weight = "Weight (kg)"
    case age = "Age"
    case sex = "Sex"
    case goal = "Goal"
    case activity = "Activity"
}
