//  Name: Yunyan Shi
//  Assignment 4
//
//  EmployeeTableViewCell.swift
//  Employees
//
//  Created by Yunyan Shi on 10/6/19.
//  Copyright © 2019 Yunyan Shi. All rights reserved.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {

    @IBOutlet weak var employeeImage: UIImageView!
    @IBOutlet weak var employeeLabel: UILabel!
    @IBOutlet weak var employeeTitle: UILabel! // add one more IBOutlet
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
