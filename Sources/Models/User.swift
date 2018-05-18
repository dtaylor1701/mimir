//
//  User.swift
//  DecisionEngine
//
//  Created by David Taylor on 3/3/18.
//  Copyright © 2018 Hyper Elephant. All rights reserved.
//

import Foundation

public class User : Codable {
    public var id: UUID?
    public var state : Feel

    public init() {
        state = Feel.Neutral()
    }
}
