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
    private static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    private static let activitiesURL = DocumentsDirectory.appendingPathComponent("activities")
    private static let emotionsURL = DocumentsDirectory.appendingPathComponent("emotions")

    
    static func storeActivities(activties: [Activity]) {
        storeItem(item: activties, path: activitiesURL)
    }
    static func retrieveActivtites() -> [Activity]? {
        return retrieveItem([Activity].self, path: activitiesURL)
    }
    
    static func storeEmotions(emotions: [Emotion]) {
        storeItem(item: emotions, path: emotionsURL)
    }
    static func retrieveEmotions() -> [Emotion]? {
        return retrieveItem([Emotion].self, path: emotionsURL)
    }
    
    private static func storeItem<T>(item: T, path: URL) where T : Encodable {
        do {
            let data = try JSONEncoder().encode(item)
            let success = NSKeyedArchiver.archiveRootObject(data, toFile: path.path)
            print(success ? "Successful save" : "Save Failed")
        } catch {
            print("Save Failed")
        }
    }
    
    private static func retrieveItem<T>(_ type: T.Type, path: URL) -> T? where T : Decodable {
        guard let data = NSKeyedUnarchiver.unarchiveObject(withFile: path.path) as? Data else {
            return nil
        }
        do {
            let activtites = try JSONDecoder().decode(T.self, from: data)
            return activtites
        } catch {
            print("Retrieve Failed")
            return nil
        }
    }
}
