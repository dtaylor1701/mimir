//
//  EmotionInterpreter.swift
//  DecisionEngine
//
//  Created by David Taylor on 3/4/18.
//  Copyright © 2018 Hyper Elephant. All rights reserved.
//

import Foundation

public class EmotionInterpreter {
    public var emotions: [Emotion]
    
    public init(emotions: [Emotion]) {
        self.emotions = emotions
    }
    
    public func getFeel(name: String) -> Feel? {
        for emotion in emotions{
            if(emotion.name.uppercased() == name.uppercased()){
                return emotion.feel;
            }
        }
        return nil
    }
}
