//  Name: Yunyan Shi
//  Lab 14
//
//  ViewController.swift
//  Chapter65
//
//  Created by Yunyan Shi on 11/23/19.
//  Copyright © 2019 Yunyan Shi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var scaleFactor: CGFloat = 2
    var angle: Double = 180
    var boxView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    func initView() {
        let frameRect = CGRect(x: 20, y: 20, width: 45, height: 45)
        boxView = UIView(frame: frameRect)
        
        if let view = boxView {
            view.backgroundColor = UIColor.blue
            self.view.addSubview(view)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location  = touch.location(in: self.view)
            let timing = UISpringTimingParameters(mass: 0.5, stiffness: 0.5, damping: 0.3, initialVelocity: CGVector(dx: 1.0, dy: 0.0))
            let animator = UIViewPropertyAnimator(duration: 2.0, timingParameters: timing)
            animator.addAnimations {
                let scaleTrans = CGAffineTransform(scaleX: self.scaleFactor, y: self.scaleFactor)
                let rotateTrans = CGAffineTransform(rotationAngle: CGFloat(self.angle * .pi / 180))
                self.boxView!.transform = scaleTrans.concatenating(rotateTrans)
                self.angle = (self.angle == 180 ? 360 : 180)
                self.scaleFactor = (self.scaleFactor == 2 ? 1 : 2)
                self.boxView?.backgroundColor = UIColor.purple
                self.boxView?.center = location
            }
            animator.addCompletion {_ in
                self.boxView?.backgroundColor = UIColor.green
            }
            animator.startAnimation()
        }
        
    
    }


}

