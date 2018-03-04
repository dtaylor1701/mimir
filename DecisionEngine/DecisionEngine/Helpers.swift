//
//  Helpers.swift
//  Mimir
//
//  Created by David Taylor on 3/1/18.
//  Copyright © 2018 Hyper Elephant. All rights reserved.
//

import Foundation

public class Helpers{
    public static func testActvities() -> [Activity]{
        var activities = [Activity]()
        activities.append(Activity(name: "drink water", duration: 15))
        activities.append(Activity(name: "play chess", duration: 90))

        return activities
    }
}
