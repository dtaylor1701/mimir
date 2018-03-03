//
//  DecisionEngine.swift
//  Mimir
//
//  Created by David Taylor on 3/1/18.
//  Copyright © 2018 Hyper Elephant. All rights reserved.
//

import Foundation


public class DecisionEngine{
    
    private var activities: [Activity]
    
    public init(activities: [Activity]) {
        self.activities = activities
    }

    public func suggestActivity(freeTime: Double) -> Activity? {
        var possible = [Activity]()
        for activity in self.activities{
            if(activity.duration <= freeTime){
                possible.append(activity)
            }
        }
        
        return possible.random()
    }
    
    public func addActivity(){}
}
