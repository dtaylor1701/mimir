//
//  Feel.swift
//  DecisionEngine
//
//  Created by David Taylor on 3/4/18.
//  Copyright © 2018 Hyper Elephant. All rights reserved.
//

import Foundation

open struct Feel : Codable {
    
    /// Happiness and/or pleasure. A negative value woudl represent unhappiness.
    public var happy: Double
    
    /// The feeling of accomplishment. Sedentary or frivolous things would have a negative value.
    public var productive: Double
    
    public static func resultant(current: Feel, impact: Feel) -> Double {
        let finalState = current + impact
        let happyTerm = componentTerm(component: finalState.happy, weight: 1.0)
        let productiveTerm = componentTerm(component: finalState.productive, weight: 1.0)
        return happyTerm + productiveTerm
        
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
    
    private static func componentTerm(component: Double, weight: Double) -> Double {
        if(component < 0){
            return weight * component * abs(component)

        }
        else {
            return weight * sqrt(component)
        }
        
    }
    
    public init(happy: Double, productive: Double) {
        self.happy = happy
        self.productive = productive
    }
    
}
