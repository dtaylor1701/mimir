//
//  Activity.swift
//  Mimir
//
//  Created by David Taylor on 3/1/18.
//  Copyright © 2018 Hyper Elephant. All rights reserved.
//

import Foundation

public struct Activity{
    public let name: String
    public let duration: Double
    
    init(name: String, duration: Double){
        self.name = name
        self.duration = duration
    }
}
