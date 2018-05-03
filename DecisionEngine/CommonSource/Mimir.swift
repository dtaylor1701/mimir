//
//  Mimir.swift
//  DecisionEngine
//
//  Created by David Taylor on 3/10/18.
//  Copyright © 2018 Hyper Elephant. All rights reserved.
//

import Foundation

public class Mimir{
    public let user: User
    private var engine: DecisionEngine
    private var interpreter: EmotionInterpreter
    
    public var activities: [Activity]
    {
        return engine.activities
    }
    public var emotions: [Emotion]
    {
        return interpreter.emotions
    }
    
    public init(activities: [Activity], emotions: [Emotion])
    {
        self.user = User()
        self.engine = DecisionEngine(user: self.user, activities: activities)
        self.interpreter = EmotionInterpreter(emotions: emotions)
    }
    
    public func addActivity(_ activity: Activity)
    {
        engine.activities.append(activity)
    }
    public func addEmotion(_ emotion: Emotion)
    {
        interpreter.emotions.append(emotion)
    }
    public func removeActivity(at: Int)
    {
        engine.activities.remove(at: at)
    }
    public func removeEmotion(at: Int)
    {
        interpreter.emotions.remove(at: at)
    }
    public func suggestActivity(freeTime: Double) -> Activity?
    {
        return engine.suggestActivity(freeTime: freeTime)
    }
    public func getEmotion(name: String) -> Emotion?
    {
        return interpreter.getEmotion(name: name)
    }
}
