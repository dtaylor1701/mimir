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
    @IBOutlet weak var impactField: UITextField!
    @IBOutlet weak var minutesLabel: UILabel!
    @IBAction func minutesSliderChanged(_ sender: Any) {
        let value = Int(minutesSlider.value)
        minutesLabel.text = "\(value) minutes"
    }
    @IBAction func addPressed(_ sender: Any) {
        guard let name = nameField.text else {
            return;
        }
        guard let impact = mimir.interpreter.getFeel(name: impactField.text!) else {
            return
        }
        let duration = Double(minutesSlider.value)
        
        let newActivity = Activity(name: name, duration: duration, feel: impact)
        mimir.user.activities.append(newActivity)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        minutesSlider.maximumValue = 120
        minutesSlider.minimumValue = 5
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
