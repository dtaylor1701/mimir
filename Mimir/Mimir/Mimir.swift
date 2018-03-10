//
//  MimirModel.swift
//  Mimir
//
//  Created by David Taylor on 3/8/18.
//  Copyright © 2018 Hyper Elephant. All rights reserved.
//

import Foundation
import DecisionEngine

class Mimir{
    let user: User
    var engine: DecisionEngine
    var interpreter: EmotionInterpreter
    
    init(activities: [Activity], emotions: [Emotion]) {
        self.user = User()
        self.user.activities = activities
        self.engine = DecisionEngine(user: self.user)
        self.interpreter = EmotionInterpreter(emotions: emotions)
    }
}
