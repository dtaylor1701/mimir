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
    
    var freeTime = -1.0
    let user: User = User()
    var engine: DecisionEngine! = nil
    var interpreter: EmotionInterpreter! = nil
    
    var stateUpdated = false
    
    @IBAction func directPressed(_ sender: Any) {
        getInfoOrMakeSuggestion()
        
    }
    
    func getInfoOrMakeSuggestion() {
        if(freeTime < 0){
            getFreeTimeFromUser()
        }
        else if (!stateUpdated){
            getStateFromUser()
        }
        else
        {
            if let activity = engine.suggestActivity(freeTime: freeTime){
                suggestionLabel.text = activity.name
            } else {
                suggestionLabel.text = "I'm as indicisive as you at the moment..."
            }
        }
    }
    
    @IBAction func returnPressed(_ sender: Any) {
        handleInput()
    }
    
    @IBAction func sendPressed(_ sender: Any) {
        handleInput()
    }
    
    func handleInput() {
        if(freeTime == -1.0){
            setFreeTimeFromUser(input: inputField.text!)
            getInfoOrMakeSuggestion()
        } else if (!stateUpdated){
            setStateFromUser(input: inputField.text!)
            getInfoOrMakeSuggestion()
        } else {
            self.view.endEditing(true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let activities = Store.retrieveActivtites() {
            user.activities = activities
        }
        if let emotions = Store.retrieveEmotions() {
            interpreter = EmotionInterpreter(emotions: emotions)
        } else {
            interpreter = EmotionInterpreter(emotions: Helpers.testEmotions())
        }
        
        engine = DecisionEngine(user: user)
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
        if let addActivityController = segue.destination as? AddActivityViewController {
            addActivityController.user = self.user
        }
    }
    
    func getFreeTimeFromUser() {
        suggestionLabel.text = "How much time you have?"
        inputField.placeholder = "Minutes"
        inputField.isHidden = false
    }
    func setFreeTimeFromUser(input: String) {
        if let time = Double(input) {
            freeTime = time
            suggestionLabel.text = "Got it."
            inputField.text = ""
        } else {
            suggestionLabel.text = "I'm not sure I understand what you mean."
            inputField.text = ""
        }
    }

    func getStateFromUser() {
        suggestionLabel.text = "How are you feeling?"
        inputField.placeholder = "Emotion"
    }
    func setStateFromUser(input: String) {
        if let feel = interpreter.getFeel(name: input) {
            user.state = feel
            suggestionLabel.text = "Got it."
            inputField.text = ""
            stateUpdated = true
        } else {
            suggestionLabel.text = "I'm not sure I understand what you mean."
            inputField.text = ""
        }
    }

}

