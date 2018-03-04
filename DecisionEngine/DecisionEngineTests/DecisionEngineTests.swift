//
//  DecisionEngineTests.swift
//  DecisionEngineTests
//
//  Created by David Taylor on 3/1/18.
//  Copyright © 2018 Hyper Elephant. All rights reserved.
//

import XCTest
@testable import DecisionEngine

class DecisionEngineTests: XCTestCase {
    
    var engine: DecisionEngine!
    
    override func setUp() {
        super.setUp()
        engine = DecisionEngine(user: User())
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testSuggestActivityNotEnoughTime() {
        let activity = engine.suggestActivity(freeTime: 5)
        XCTAssert(activity == nil, "Returning actvity that takes too much time")
    }
    
    func testSuggestActivity() {
        let activity = engine.suggestActivity(freeTime: 20)
        XCTAssert(activity?.name == "drink water", "Not returning the right activity")
    }
    
}
