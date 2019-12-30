//  Name: Yunyan Shi
//
//  ViewController.swift
//  Chapter22
//
//  Created by Yunyan Shi on 9/25/19.
//  Copyright © 2019 Yunyan Shi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var viewB: UIView!
    
    @IBOutlet weak var centerConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewB.removeConstraint(centerConstraint)
        
        let constraint = NSLayoutConstraint(item: myLabel!, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: myButton, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1.0, constant: 0.0)
        self.view.addConstraint(constraint)
    }


}

