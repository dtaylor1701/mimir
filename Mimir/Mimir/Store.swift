//
//  Store.swift
//  Mimir
//
//  Created by David Taylor on 3/4/18.
//  Copyright © 2018 Hyper Elephant. All rights reserved.
//

import Foundation
import DecisionEngine

class Store {
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let activitiesURL = DocumentsDirectory.appendingPathComponent("activities")
    
    static func storeActivities(activties: [Activity]) {
        do {
            let data = try JSONEncoder().encode(activties)
            let success = NSKeyedArchiver.archiveRootObject(data, toFile: activitiesURL.path)
            print(success ? "Successful save" : "Save Failed")
        } catch {
            print("Save Failed")
        }
    }
    static func retrieveActivtites() -> [Activity]? {
        guard let data = NSKeyedUnarchiver.unarchiveObject(withFile: activitiesURL.path) as? Data else {
            return nil
        }
        do {
            let activtites = try PropertyListDecoder().decode([Activity].self, from: data)
            return activtites
        } catch {
            print("Retrieve Failed")
            return nil
        }
    }
}
