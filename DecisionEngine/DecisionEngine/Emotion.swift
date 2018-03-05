//
//  Emotion.swift
//  DecisionEngine
//
//  Created by David Taylor on 3/4/18.
//  Copyright © 2018 Hyper Elephant. All rights reserved.
//

import Foundation

public struct Emotion : Codable {
    public var name: String
    /// The feeling of being this emotion
    public var feel: Feel
}
