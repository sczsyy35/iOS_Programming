//  Name: Yunyan Shi
//
//  ViewController.swift
//  TempConverter
//
//  Created by Yunyan Shi on 9/15/19.
//  Copyright © 2019 Yunyan Shi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tempText: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
  
    @IBAction func textFieldReturn(_ sender: UITextField) {
        _ = sender.resignFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        tempText.endEditing(true)
    }
    
    
    @IBAction func convertTemp(_ sender: UIButton) {
        guard let tempString = tempText.text else { return }
        
        switch sender.tag{
        case 1:
            if let temp = Double(tempString) {
                let newTemp = (temp - 32)/1.8
                resultLabel.text = "Celsius \(String(format: "%.1f", newTemp))°"
            }
            
        case 2:
            if let temp = Double(tempString) {
                let newTemp = temp * 1.8 + 32
                resultLabel.text = "Fahrenheit \(String(format: "%.1f", newTemp))°"
            }
            
        default:
            resultLabel.text = ""
        }
    }
    
}

