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
    @IBOutlet weak var inputField: UITextField!
    
    @IBAction func returnPressed(_ sender: Any) {
        setFreeTimeFromUser(input: inputField.text!)
    }
    
    var freeTime = -1.0
    let user: User = User()
    var engine: DecisionEngine! = nil
    
    @IBAction func directPressed(_ sender: Any) {
        
        if(freeTime < 0){
            getFreeTimeFromUser()
        } else {
            if let activity = engine.suggestActivity(freeTime: freeTime){
                suggestionLabel.text = activity.name
            } else {
                suggestionLabel.text = "I'm as indicisive as you at the moment..."
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        engine = DecisionEngine(user: user)
        suggestionLabel.text = "Need some direction?"
        inputField.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true);
    }
    
    func getFreeTimeFromUser(){
        suggestionLabel.text = "First, could you tell me how much time you have?"
        inputField.placeholder = "Minutes"
        inputField.isHidden = false
    }
    
    func setFreeTimeFromUser(input: String) {
        if let time = Double(input) {
            inputField.isHidden = true
            freeTime = time
            self.view.endEditing(true);
            suggestionLabel.text = "Got it."
            inputField.text = ""
        } else {
            suggestionLabel.text = "I'm not sure I understand what you mean."
        }
    }
    

}

