//
//  AddEmotionViewController.swift
//  Mimir
//
//  Created by David Taylor on 3/8/18.
//  Copyright © 2018 Hyper Elephant. All rights reserved.
//

import UIKit
import Mimir

class AddEmotionViewController: UIViewController {

    var mimir: Mimir!
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var happySlider: UISlider!
    @IBOutlet weak var productiveSlider: UISlider!
    @IBOutlet weak var happyLabel: UILabel!
    @IBOutlet weak var productiveLabel: UILabel!
    @IBAction func happyChanged(_ sender: Any) {
        
        let value = Int(happySlider.value)
        happyLabel.text = "\(value)"
    }
    @IBAction func productiveChanged(_ sender: Any) {
        let value = Int(productiveSlider.value)
        productiveLabel.text = "\(value)"
    }
    @IBAction func addPressed(_ sender: Any) {
        guard let name = nameField.text else {
            return
        }
        let happy = Double(happySlider.value)
        let productive = Double(productiveSlider.value)
        
        let feel = Feel(happy: happy, productive: productive)
        let newEmotion = Emotion(name: name, feel: feel)
        
        mimir.addEmotion(newEmotion)
        Store.storeEmotions(emotions: mimir.emotions)

    }
    override func viewDidLoad() {
        super.viewDidLoad()

        happySlider.maximumValue = 10
        happySlider.minimumValue = -10
        happySlider.value = 0
        happyLabel.text = "0"
        
        productiveSlider.maximumValue = 10
        productiveSlider.minimumValue = -10
        productiveSlider.value = 0
        productiveLabel.text = "0"
        
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
