// Name: Yunyan Shi
// CIS 137 Assignment 2

//  ViewController.swift
//  Magic8Ball
//
//  Created by Yunyan Shi on 9/15/19.
//  Copyright © 2019 Yunyan Shi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Create an IBOutlet for the result label
    @IBOutlet weak var resultLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Create an IBAction function that generates a random array index and displays a random answer in the label once the button is pressed 
    @IBAction func showAnswer(_ sender: Any) {
        let index = Int(arc4random_uniform(20))
        let theArray: [String] = ["It is certain", "It is decidedly so", "Without a doubt", "Yes - definitely", "You may rely on it", "As I see it, yes", "Most likely", "Outlook good", "Signs point to yes",  "Yes", "Reply hazy, try again", "Ask again later", "Better not tell you now", "Cannot predict now", "Concentrate and ask again", "Don't count on it",  "My reply is no", "My sources say no", "Outlook not so good", "Very doubtful"]
        resultLabel.text = theArray[index]
        
    }
    


}

