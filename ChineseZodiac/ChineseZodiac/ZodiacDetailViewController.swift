//  Name: Yunyan Shi
//  CIS 137
//  Midterm Project: Chinese Zodiac
//
//  ZodiacDetailViewController.swift
//  ChineseZodiac
//
//  Created by Yunyan Shi on 10/20/19.
//  Copyright © 2019 Yunyan Shi. All rights reserved.
//

import UIKit

class ZodiacDetailViewController: UIViewController {
    // Data passed from the ZodiacTableViewController
    var names: String?
    var images: String?
    var years: String?
    var traits: String?
    
    // Create IBOutlets for the ImageView, TextView, and the two Labels
    @IBOutlet weak var animalImage: UIImageView!
    @IBOutlet weak var animalName: UILabel!
    @IBOutlet weak var birthYears: UILabel!
    @IBOutlet weak var animalTrait: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Prevent the large font from applying to this view controller
        navigationItem.largeTitleDisplayMode = .never
        
        animalName.text = names
        
        //Force-unwrap using '!' to abort execution if the optional value contains 'nil'
        animalImage.image = UIImage(named: images!)
        
        birthYears.text = years
        animalTrait.text = traits
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
