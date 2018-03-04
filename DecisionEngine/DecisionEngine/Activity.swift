//
//  Activity.swift
//  Mimir
//
//  Created by David Taylor on 3/1/18.
//  Copyright © 2018 Hyper Elephant. All rights reserved.
//

import Foundation

public struct Activity{
    public var name: String
    public var duration: Double
    ///The change in feeling the activity imparts on the participant
    public var impact: Feel
    
    init(name: String, duration: Double, feel: Feel = Feel.Neutral()){
        self.name = name
        self.duration = duration
        self.impact = feel
    }
}
