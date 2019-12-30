//  Name: Yunyan Shi
//  Lab 12
//
//  ViewController.swift
//  Chapter57
//
//  Created by Yunyan Shi on 11/11/19.
//  Copyright © 2019 Yunyan Shi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var methodStatus: UILabel!
    @IBOutlet weak var touchStatus: UILabel!
    @IBOutlet weak var tapStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with
        event: UIEvent?) {
        let touchCount = touches.count
        if let touch = touches.first {
            let tapCount = touch.tapCount
            methodStatus.text = "touchesBegan"
            touchStatus.text = "\(touchCount) touches"
            tapStatus.text = "\(tapCount) taps"
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with
        event: UIEvent?) {
        let touchCount = touches.count
        if let touch = touches.first {
            let tapCount = touch.tapCount
            methodStatus.text = "touchesMoved";
            touchStatus.text = "\(touchCount) touches"
            tapStatus.text = "\(tapCount) taps"
            
            if let eventObj = event,
                let predictedTouches = eventObj.predictedTouches(for: touch) {
                for predictedTouch in predictedTouches {
                    let point = predictedTouch.location(in: self.view)
                    print("Predicted location X = \(point.x), Y = \(point.y)")
                }
                print("============")
            }
        
            
            if let eventObj = event,
                let coalescedTocuhes = eventObj.coalescedTouches(for: touch) {
                for coalescedTouch in coalescedTocuhes {
                    let point = coalescedTouch.location(in: self.view)
                    print("Coalesced location X = \(point.x), Y = \(point.y)")
                }
                print("============")
            }
        }
    }
        
        
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with
        event: UIEvent?) {
        let touchCount = touches.count
        if let touch = touches.first {
            let tapCount = touch.tapCount
            methodStatus.text = "touchesEnded";
            touchStatus.text = "\(touchCount) touches"
            tapStatus.text = "\(tapCount) taps"
        }
    }



}

