//  Name: Yunyan Shi
//  Lab 12
//
//  ViewController.swift
//  Chapter58
//
//  Created by Yunyan Shi on 11/11/19.
//  Copyright © 2019 Yunyan Shi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var xCoord: UILabel!
    @IBOutlet weak var yCoord: UILabel!
    
    var startPoint: CGPoint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let theTouch = touches.first {
            startPoint = theTouch.location(in: self.view)
            if let x = startPoint?.x, let y = startPoint?.y {
                xCoord.text = ("x = \(x)")
                yCoord.text = ("y = \(y)")
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let theTouch = touches.first {
            let touchLocation = theTouch.location(in: self.view)
            let x = touchLocation.x
            let y = touchLocation.y
            xCoord.text = ("x = \(x)")
            yCoord.text = ("y = \(y)")
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let theTouch = touches.first {
            let endPoint = theTouch.location(in: self.view)
            let x = endPoint.x
            let y = endPoint.y
            xCoord.text = ("x = \(x)")
            yCoord.text = ("y = \(y)")
        }
    }


}

