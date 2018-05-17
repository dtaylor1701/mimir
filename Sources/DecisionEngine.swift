//
//  DecisionEngine.swift
//  Mimir
//
//  Created by David Taylor on 3/1/18.
//  Copyright © 2018 Hyper Elephant. All rights reserved.
//

import Foundation


internal class DecisionEngine{
    
    private var user: User
    var activities: [Activity]
    
    init(user: User, activities: [Activity]) {
        self.user = user
        self.activities = activities
    }

    func suggestActivity(freeTime: Double) -> Activity? {
        var best = Feel.resultant(current: user.state, impact: Feel.Neutral())
        var possible = [Activity]()
        for activity in self.activities
        {
            if(activity.duration > freeTime) {
                continue
            }
            let resultant = Feel.resultant(current: user.state, impact: activity.impact)
            if(resultant > best){
                possible = [activity]
                best = resultant
            } else if (resultant == best){
                possible.append(activity)
            }
        }
        return possible.random()
    }
}
