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

        if let activities = Store.retrieveActivtites(), let emotions = Store.retrieveEmotions()
        {
            mimir = Mimir(activities: activities, emotions: emotions)

        }
        else
        {
            print("Could not load data from the store");
            mimir = Mimir(activities: [Activity](), emotions: [Emotion]())
        }
        
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
