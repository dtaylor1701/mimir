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
        var possible = [Activity]()
        for activity in self.activities{
            let hasTime = activity.duration <= freeTime
            let resultFeel = user.state + activity.impact
            let willImprove = user.state.average() < resultFeel.average()
            if(hasTime && willImprove)
            {
                possible.append(activity)
            }
        }
        return possible.random()
    }
}
