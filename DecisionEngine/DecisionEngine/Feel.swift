//
//  Feel.swift
//  DecisionEngine
//
//  Created by David Taylor on 3/4/18.
//  Copyright © 2018 Hyper Elephant. All rights reserved.
//

import Foundation

public struct Feel : Codable {
    
    /// Happiness and/or pleasure. A negative value woudl represent unhappiness.
    var happy: Double
    
    /// The feeling of accomplishment. Sedentary or frivolous things would have a negative value.
    var productive: Double
    
    public func average() -> Double {
        return (happy + productive) / 2
    }
    
    public static func +(left: Feel, right: Feel) -> Feel {
        return Feel(happy: left.happy + right.happy, productive: left.productive + right.productive)
    }
    public static func -(left: Feel, right: Feel) -> Feel {
        return Feel(happy: left.happy - right.happy, productive: left.productive - right.productive)
    }
    
    public static func Neutral() -> Feel {
        return Feel(happy: 0.0, productive: 0.0)
    }
    
    public init(happy: Double, productive: Double) {
        self.happy = happy
        self.productive = productive
    }
    
}
