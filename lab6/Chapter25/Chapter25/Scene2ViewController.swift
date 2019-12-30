//
//  Scene2ViewController.swift
//  Chapter25
//
//  Created by Yunyan Shi on 9/29/19.
//  Copyright © 2019 Yunyan Shi. All rights reserved.
//

import UIKit

class Scene2ViewController: UIViewController {

    @IBOutlet weak var scene2Label: UILabel!
    
    var labelText: String?
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        scene2Label.text = labelText

        // Do any additional setup after loading the view.
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
