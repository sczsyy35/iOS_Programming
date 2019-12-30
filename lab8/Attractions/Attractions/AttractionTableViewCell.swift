//  Name: Yunyan Shi
//
//  AttractionTableViewCell.swift
//  Attractions
//
//  Created by Yunyan Shi on 10/6/19.
//  Copyright © 2019 Yunyan Shi. All rights reserved.
//

import UIKit

class AttractionTableViewCell: UITableViewCell {

    @IBOutlet weak var attractionImage: UIImageView!
    @IBOutlet weak var attractionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }    
}
