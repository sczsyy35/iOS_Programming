//  Name: Yunyan Shi
//
//  ViewController.swift
//  Chapter25
//
//  Created by Yunyan Shi on 9/28/19.
//  Copyright © 2019 Yunyan Shi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scene1Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
            as! Scene2ViewController
        destination.labelText = "Arrived from scene 1"
    }
    
    @IBAction func returned(seque: UIStoryboardSegue) {
        scene1Label.text = "Returned from Scene 2"
    }
    
    


}

