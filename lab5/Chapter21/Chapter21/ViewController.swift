//  Name: Yunyan Shi
//
//  ViewController.swift
//  Chapter21
//
//  Created by Yunyan Shi on 9/23/19.
//  Copyright © 2019 Yunyan Shi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createLayout()
    }
    
    func createLayout() {
        let superview = self.view
        
        let myLabel = UILabel()
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myLabel.text = "My Label"
        
        let myButton = UIButton()
        
        myButton.setTitle("My button", for: UIControl.State.normal)
        myButton.backgroundColor = UIColor.blue
        myButton.translatesAutoresizingMaskIntoConstraints = false
        superview?.addSubview(myLabel)
        superview?.addSubview(myButton)
        
        var myConstraint = NSLayoutConstraint(item: myLabel, attribute:
            NSLayoutConstraint.Attribute.centerY, relatedBy:
            NSLayoutConstraint.Relation.equal, toItem: superview, attribute:
            NSLayoutConstraint.Attribute.centerY, multiplier: 1.0, constant: 0)
        
        superview?.addConstraint(myConstraint)
        
        myConstraint = NSLayoutConstraint(item: myLabel, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: superview, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1.0, constant: 0)
        
        superview?.addConstraint((myConstraint))
        
        myConstraint = NSLayoutConstraint(item: myButton, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: myLabel, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1.0, constant: -10)
        
        superview?.addConstraint(myConstraint)
        
        myConstraint = NSLayoutConstraint(item: myButton, attribute: NSLayoutConstraint.Attribute.lastBaseline, relatedBy: NSLayoutConstraint.Relation.equal, toItem: myLabel, attribute: NSLayoutConstraint.Attribute.lastBaseline, multiplier: 1.0, constant: 0)
        
        superview?.addConstraint(myConstraint)
    }


}

