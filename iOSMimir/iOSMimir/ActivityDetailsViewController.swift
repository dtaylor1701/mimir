//
//  ActivityDetailsViewController.swift
//  Mimir
//
//  Created by David Taylor on 3/26/18.
//  Copyright © 2018 Hyper Elephant. All rights reserved.
//

import UIKit
import Mimir

class ActivityDetailsViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var happySlider: UISlider!
    @IBOutlet weak var productiveSlider: UISlider!
    @IBOutlet weak var durationSlider: UISlider!
    @IBAction func happySliderChanged(_ sender: Any) {
        happyLabel.text = "\(Int(happySlider.value))"
    }
    @IBAction func productiveSliderChanged(_ sender: Any) {
        productiveLabel.text = "\(Int(productiveSlider.value))"
    }
    @IBAction func durationSliderChanged(_ sender: Any) {
        durationLabel.text = "\(Int(durationSlider.value))"

    }
    @IBOutlet weak var happyLabel: UILabel!
    @IBOutlet weak var productiveLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        if let selected = activity {
            selected.name = nameField.text!
            selected.impact = Feel(happy: Double(happySlider.value), productive: Double(productiveSlider.value))
            selected.duration = Double(durationSlider.value)
        }
    }
    
    private var activity: Activity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        happySlider.minimumValue = -10
        happySlider.maximumValue = 10
        productiveSlider.minimumValue = -10
        productiveSlider.maximumValue = 10
        durationSlider.maximumValue = 120
        durationSlider.minimumValue = 5
        if let selected = activity{
            populateValues(with: selected)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setActivity(_ activity: Activity) {
        self.activity = activity
        if(self.isViewLoaded){
            populateValues(with: activity)
        }
    }
    
    private func populateValues(with activity: Activity){
        self.nameField.text = activity.name
        self.happySlider.value = Float(activity.impact.happy)
        self.productiveSlider.value = Float(activity.impact.productive)
        self.durationSlider.value = Float(activity.duration)
        happyLabel.text = "\(Int(happySlider.value))"
        productiveLabel.text = "\(Int(productiveSlider.value))"
        durationLabel.text = "\(Int(durationSlider.value))"

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
