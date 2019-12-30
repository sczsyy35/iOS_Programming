//  Name: Yunyan Shi
//  Lab 12
//
//  ViewController.swift
//  Chapter60
//
//  Created by Yunyan Shi on 11/11/19.
//  Copyright © 2019 Yunyan Shi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapDetected(_ sender: UITapGestureRecognizer) {
        statusLabel.text = "Double Tap"
    }
    @IBAction func pinchDetected(_ sender: UIPinchGestureRecognizer) {
        let scale = sender.scale
        let velocity = sender.velocity
        let resultString = "Pinch - scale = \(scale), velocity = \(velocity)"
        statusLabel.text = resultString
    }
    @IBAction func rotationDetected(_ sender: UIRotationGestureRecognizer) {
        let radians = sender.rotation
        let velocity = sender.velocity
        let resultString = "Rotation - Radians = \(radians), velocity = \(velocity)"
        statusLabel.text = resultString
    }
    @IBAction func swipeDetected(_ sender: UISwipeGestureRecognizer) {
        statusLabel.text = "Right swipe"
    }
    @IBAction func longPressDetected(_ sender: UILongPressGestureRecognizer) {
        statusLabel.text = "Long Press"
    }
    
}

