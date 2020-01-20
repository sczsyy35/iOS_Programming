//  Name: Yunyan Shi
//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Yunyan Shi on 9/23/19.
//  Copyright © 2019 Yunyan Shi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var choices: UITextField!
    
    @IBOutlet weak var outcome: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // We could also create one IBAction function for three buttons like we did last time but the parameter must be changed from any to UIButton
    
    @IBAction func rockSelected(_ sender: Any) {
        showResults(playersChoice: "Rock")
    }
    
    @IBAction func paperSelected(_ sender: Any) {
        showResults(playersChoice: "Paper")
    }
    
    @IBAction func scissorsSelected(_ sender: Any) {
        showResults(playersChoice: "Scissors")
    }
    
    func showResults(playersChoice: String) {
        let theArray: [String] = ["Rock", "Scissors", "Paper"]
        let index = Int(arc4random_uniform(3))
        let computersChoice = theArray[index]
        choices.text = "\(playersChoice) vs. \(computersChoice) "
        
        let choiceTuple = (playersChoice, computersChoice)
        
        switch choiceTuple {
        case ("Rock", "Scissors"):
            outcome.text = "You win! 🥰"
        case ("Rock", "Paper"):
            outcome.text = "You lose! 🤢"
        
       
        case ("Paper", "Rock"):
            outcome.text = "You win! 🥰"
        case ("Paper", "Scissors"):
            outcome.text = "You lose!🤢"
            
        case("Scissors", "Paper"):
            outcome.text = "You win! 🥰"
        case("Scissors", "Rock"):
            outcome.text = "You lose! 🤢"
            
        default:
            outcome.text = "It's a tie. 😶"
        }
        
    }
    
}

