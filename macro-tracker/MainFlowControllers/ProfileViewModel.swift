//
//  ProfileViewModel.swift
//  macro-tracker
//
//  Created by Felix on 2020-03-13.
//  Copyright © 2020 Felix. All rights reserved.
//

import CoreData
import Foundation
import UIKit

struct ProfileDatabaseHandler {
    
    let managedContext: NSManagedObjectContext
    
    init?() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        managedContext = appDelegate.persistentContainer.viewContext
    }
    
    func createProfile(height: Double, weight: Double, sex: Sex, age: Int, goal: Goal, activityLevel: ActivityLevel) {
        let profileEntity = NSEntityDescription.entity(forEntityName: "ProfileInfo", in: managedContext)!
        let profileInfo = NSManagedObject(entity: profileEntity, insertInto: managedContext)
        
        profileInfo.setValuesForKeys([
            "height": height,
            "weight": weight,
            "sex": sex.rawValue,
            "age": age,
            "goal": goal.rawValue,
            "activityLevel": activityLevel.rawValue])
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error)")
        }
    }
    
    func retrieveProfileData() -> ProfileInfo? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ProfileInfo")
        
        do {
            return try managedContext.fetch(fetchRequest)[0] as? ProfileInfo
        } catch let error as NSError {
            print("Could not retrieve data. \(error)")
        }
        return nil
    }
    
    func updateData(key: String, value: Any) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ProfileInfo")
        
        do {
            let profileObject = try managedContext.fetch(fetchRequest)[0] as! NSManagedObject
            profileObject.setValue(value, forKey: key)
            try managedContext.save()
        } catch let error as NSError {
            print("Could not Update Data. \(error)")
        }

    }
}
