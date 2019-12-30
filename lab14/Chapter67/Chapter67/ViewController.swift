//  Name: Yunyan Shi
//  Lab 14
//
//  ViewController.swift
//  Chapter67
//
//  Created by Yunyan Shi on 11/25/19.
//  Copyright © 2019 Yunyan Shi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var blueBoxView: UIView?
    var redBoxView: UIView?
    
    var animator: UIDynamicAnimator?
    
    var currentLocation: CGPoint?
    var attachment: UIAttachmentBehavior?

    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    
    func initViews() {
        var frameRect = CGRect(x: 10, y: 20, width: 80, height: 80)
        blueBoxView = UIView(frame: frameRect)
        blueBoxView?.backgroundColor = UIColor.blue
        
        frameRect = CGRect(x: 150, y: 20, width: 60, height: 60)
        redBoxView = UIView(frame: frameRect)
        redBoxView?.backgroundColor = UIColor.red
       
        if let blueBox = blueBoxView, let redBox = redBoxView {
            self.view.addSubview(blueBox)
            self.view.addSubview(redBox)
            
            animator = UIDynamicAnimator(referenceView: self.view)
            
            let gravity = UIGravityBehavior(items: [blueBox, redBox])
            let vector = CGVector(dx: 0.0, dy: 1.0)
            gravity.gravityDirection = vector
            
            let collision = UICollisionBehavior(items: [blueBox, redBox])
            collision.translatesReferenceBoundsIntoBoundary = true
            
            let behavior = UIDynamicItemBehavior(items: [blueBox])
            behavior.elasticity = 0.5
            
            let boxAttachment = UIAttachmentBehavior(item: blueBox, attachedTo: redBox)
            boxAttachment.frequency = 4.0
            boxAttachment.damping = 0.0
            
            animator?.addBehavior(boxAttachment)
            
            animator?.addBehavior(behavior)
            animator?.addBehavior(collision)
            animator?.addBehavior(gravity)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let theTouch = touches.first, let blueBox =
            blueBoxView {
            currentLocation = theTouch.location(in: self.view) as CGPoint?
            if let location = currentLocation {
                let offset = UIOffset(horizontal: 20, vertical: 20)
                attachment = UIAttachmentBehavior(item: blueBox, offsetFromCenter:
                    offset, attachedToAnchor: location)
            }
            if let attach = attachment {
                animator?.addBehavior(attach)
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let theTouch = touches.first {
            currentLocation = theTouch.location(in: self.view)
            if let location = currentLocation {
                attachment?.anchorPoint = location
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let attach = attachment {
            animator?.removeBehavior(attach)
        }
    }

    
}

