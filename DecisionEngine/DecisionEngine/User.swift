//
//  User.swift
//  DecisionEngine
//
//  Created by David Taylor on 3/3/18.
//  Copyright © 2018 Hyper Elephant. All rights reserved.
//

import Foundation

public class User {
    public var activities: [Activity]
    public var state : Feel

    public init() {
        activities = Helpers.testActvities()
        state = Feel.Neutral()
    }
}
