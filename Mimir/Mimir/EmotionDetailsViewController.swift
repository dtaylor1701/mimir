//
//  EmotionDetailsViewController.swift
//  Mimir
//
//  Created by David Taylor on 4/15/18.
//  Copyright © 2018 Hyper Elephant. All rights reserved.
//

import UIKit
import DecisionEngine

class EmotionDetailsViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var happySlider: UISlider!
    @IBOutlet weak var productiveSlider: UISlider!
    @IBOutlet weak var happyLabel: UILabel!
    @IBOutlet weak var productiveLabel: UILabel!
    @IBAction func happySliderChanged(_ sender: Any) {
        happyLabel.text = String(Int(happySlider.value))
    }
    @IBAction func productiveSliderChanged(_ sender: Any) {
        productiveLabel.text = String(Int(productiveSlider.value))
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        if let selected = emotion {
            selected.name = nameField.text!
            selected.feel = Feel(happy: Double(happySlider.value), productive: Double(productiveSlider.value))
        }
    }
    
    private var emotion: Emotion?

    override func viewDidLoad() {
        super.viewDidLoad()
        happySlider.minimumValue = -10
        happySlider.maximumValue = 10
        productiveSlider.minimumValue = -10
        productiveSlider.maximumValue = 10
        if let selected = emotion{
            populateValues(with: selected)
        }
        // Do any additional setup after loading the view.
    }

    func setEmotion(_ emotion: Emotion) {
        self.emotion = emotion
        if(self.isViewLoaded){
            populateValues(with: emotion)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    private func populateValues(with emotion: Emotion){
        self.nameField.text = emotion.name
        self.happySlider.value = Float(emotion.feel.happy)
        self.productiveSlider.value = Float(emotion.feel.productive)
        happyLabel.text = "\(Int(happySlider.value))"
        productiveLabel.text = "\(Int(productiveSlider.value))"
        
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
