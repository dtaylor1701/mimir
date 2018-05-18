//
//  Activity.swift
//  Mimir
//
//  Created by David Taylor on 3/1/18.
//  Copyright © 2018 Hyper Elephant. All rights reserved.
//

import Foundation

public class Activity : Codable {
    public var id: UUID?
    public var name: String
    public var duration: Double
    ///The change in feeling the activity imparts on the participant
    public var impact: Feel
    
    public init(name: String, duration: Double, feel: Feel = Feel.Neutral()){
        self.name = name
        self.duration = duration
        self.impact = feel
    }
}
