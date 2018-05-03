//
//  EmotionInterpreter.swift
//  DecisionEngine
//
//  Created by David Taylor on 3/4/18.
//  Copyright © 2018 Hyper Elephant. All rights reserved.
//

import Foundation

internal class EmotionInterpreter {
    var emotions: [Emotion]
    
    init(emotions: [Emotion]) {
        self.emotions = emotions
    }
    
    func getEmotion(name: String) -> Emotion? {
        for emotion in emotions{
            if(emotion.name.uppercased() == name.uppercased()){
                return emotion;
            }
        }
        return nil
    }
}
