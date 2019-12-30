//  Name: Yunyan Shi
//  Assignment 4 --> Lab 10
//
//  EmployeeDetailViewController.swift
//  Employees
//
//  Created by Yunyan Shi on 10/21/19.
//  Copyright © 2019 Yunyan Shi. All rights reserved.
//

import UIKit
import WebKit

class EmployeeDetailViewController: UIViewController {
    var webSite: String?

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        if let address = webSite,
            let webURL = URL(string: address) {
            let urlRequest = URLRequest(url: webURL)
            webView.load(urlRequest)
        }
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
