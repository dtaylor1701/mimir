//
//  AddActivityViewController.swift
//  Mimir
//
//  Created by David Taylor on 3/7/18.
//  Copyright © 2018 Hyper Elephant. All rights reserved.
//

import UIKit
import DecisionEngine

class AddActivityViewController: UIViewController {

    var mimir: Mimir!
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var minutesSlider: UISlider!
    @IBOutlet weak var minutesLabel: UILabel!
    @IBAction func minutesSliderChanged(_ sender: Any) {
        let value = Int(minutesSlider.value)
        minutesLabel.text = "\(value) minutes"
    }
    @IBOutlet weak var happySlider: UISlider!
    @IBAction func happySliderChanged(_ sender: Any) {
        happyLabel.text = "\(Int(happySlider.value))"
    }
    @IBOutlet weak var productiveSlider: UISlider!
    @IBAction func productiveSliderChanged(_ sender: Any) {
        productiveLabel.text = "\(Int(productiveSlider.value))"
    }
    @IBOutlet weak var happyLabel: UILabel!
    @IBOutlet weak var productiveLabel: UILabel!
    @IBAction func addPressed(_ sender: Any) {
        guard let name = nameField.text else {
            return;
        }
        let happy = Double(happySlider.value)
        let productive = Double(productiveSlider.value)
        let impact = Feel(happy: happy, productive: productive)
        let duration = Double(minutesSlider.value)
        
        let newActivity = Activity(name: name, duration: duration, feel: impact)
        mimir.addActivity(newActivity)
        Store.storeActivities(activties: mimir.activities)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        happySlider.maximumValue = 10
        happySlider.minimumValue = -10
        happySlider.value = 0
        
        productiveSlider.maximumValue = 10
        productiveSlider.minimumValue = -10
        productiveSlider.value = 0
        
        happyLabel.text = "0"
        productiveLabel.text = "0"
        
        minutesSlider.maximumValue = 120
        minutesSlider.minimumValue = 5
        minutesSlider.value = 30
        let value = Int(minutesSlider.value)
        minutesLabel.text = "\(value) minutes"
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
