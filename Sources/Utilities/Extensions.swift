//
//  Extensions.swift
//  DecisionEngine
//
//  Created by David Taylor on 3/3/18.
//  Copyright © 2018 Hyper Elephant. All rights reserved.
//

import Foundation


extension Array {
    func random() -> Element? {
        if(self.count > 0){
            let chosenIndex = Int(arc4random_uniform(UInt32(self.count)))
            return self[chosenIndex]
        } else {
            return nil
        }
    }
}
