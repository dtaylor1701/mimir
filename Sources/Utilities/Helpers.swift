//
//  Helpers.swift
//  Mimir
//
//  Created by David Taylor on 3/1/18.
//  Copyright © 2018 Hyper Elephant. All rights reserved.
//

import Foundation

public class Helpers{
    public static func testActvities() -> [Activity]
    {
        var activities = [Activity]()
        activities.append(Activity(name: "drink water", duration: 15, feel: Feel(happy: 2, productive: 1)))
        activities.append(Activity(name: "play chess", duration: 90, feel: Feel(happy: 4, productive: 0)))

        return activities
    }
    
    public static func defaultEmotions() -> [Emotion] {
        var emotions = [Emotion]()
        emotions.append(Emotion(name: "Happy", feel: Feel(happy: 8, productive: 0)))
        emotions.append(Emotion(name: "Sad", feel: Feel(happy: -8, productive: 0)))
        emotions.append(Emotion(name: "Productive", feel: Feel(happy: 0, productive: 8)))
        emotions.append(Emotion(name: "Unproductive", feel: Feel(happy: 0, productive: -8)))
        return emotions
    }
}
