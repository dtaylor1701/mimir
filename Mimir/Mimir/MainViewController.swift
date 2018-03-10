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
    
    var mimir: Mimir!
    
    @IBAction func directPressed(_ sender: Any) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let rootController = self.tabBarController as! RootTabBarController
        self.mimir = rootController.mimir
        
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
    
    

}

