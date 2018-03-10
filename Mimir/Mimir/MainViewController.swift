//
//  ViewController.swift
//  Mimir
//
//  Created by David Taylor on 3/1/18.
//  Copyright © 2018 Hyper Elephant. All rights reserved.
//

import UIKit
import DecisionEngine

class ViewController: UIViewController {

    @IBOutlet weak var suggestionLabel: UILabel!
    @IBOutlet weak var moodField: UITextField!
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var timeLabel: UILabel!
    
    var mimir: Mimir!
    
    @IBAction func directPressed(_ sender: Any) {
        guard let emotion = mimir.getEmotion(name: moodField.text!) else {
            suggestionLabel.text = "I'm not familiar with that emotion"
            return
        }
        let time = Double(timeSlider.value)
        
        mimir.user.state = emotion.feel
        if let suggestion = mimir.suggestActivity(freeTime: time)  {
            suggestionLabel.text = suggestion.name
        } else {
            suggestionLabel.text = "I can't help at the moment"
        }
        
    }
    @IBAction func timeSliderChanged(_ sender: Any) {
        let value = Int(timeSlider.value)
        timeLabel.text = "\(value) minutes"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let rootController = self.tabBarController as! RootTabBarController
        self.mimir = rootController.mimir
        
        timeSlider.maximumValue = 120;
        timeSlider.minimumValue = 5;
        timeSlider.value = 30;
        timeLabel.text = "30 minutes"
        suggestionLabel.text = "Need some direction?"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    @IBAction func unwindToMainViewController(segue: UIStoryboardSegue){
        
    }
}

