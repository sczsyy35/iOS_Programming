//  Name: Yunyan Shi
//  CIS 137
//  Midterm Project: Chinese Zodiac
//
//  ZodiacTableViewCell.swift
//  ChineseZodiac
//
//  Created by Yunyan Shi on 10/20/19.
//  Copyright © 2019 Yunyan Shi. All rights reserved.
//

import UIKit

class ZodiacTableViewCell: UITableViewCell {

    // Create IBOutlets for the ImageView and the Label
    @IBOutlet weak var zodiacImage: UIImageView!
    @IBOutlet weak var zodiacLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
