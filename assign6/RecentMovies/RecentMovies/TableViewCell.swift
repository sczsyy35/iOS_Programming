//  Name: Yunyan Shi
//  Assignment 6
//
//  TableViewCell.swift
//  RecentMovies
//
//  Created by Yunyan Shi on 11/20/19.
//  Copyright © 2019 Yunyan Shi. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieData: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
