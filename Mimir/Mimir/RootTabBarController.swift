//
//  RootTabBarController.swift
//  Mimir
//
//  Created by David Taylor on 3/8/18.
//  Copyright © 2018 Hyper Elephant. All rights reserved.
//

import UIKit
import DecisionEngine

class RootTabBarController: UITabBarController {

    var mimir: Mimir!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var activities: [Activity]!
        var emotions: [Emotion]!
        
        if let loaded = Store.retrieveActivtites()
        {
            activities = loaded
        }
        else
        {
            print("Could not load activity data from the store");
            activities = [Activity]()
        }
        
        if let loaded = Store.retrieveEmotions()
        {
            emotions = loaded
        }
        else
        {
            print("Could not load emotion data from the store");
            emotions = Helpers.defaultEmotions()
        }
        mimir = Mimir(activities: activities, emotions: emotions)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
