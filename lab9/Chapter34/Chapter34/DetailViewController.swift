//  Name: Yunyan Shi
//  Lab 9
//
//  DetailViewController.swift
//  Chapter34
//
//  Created by Yunyan Shi on 10/12/19.
//  Copyright © 2019 Yunyan Shi. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var detailDescriptionLabel: UILabel!


    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let myWebview = webView {
                let url = NSURL(string: detail)
                let request = NSURLRequest(url: url! as URL)
                myWebview.load(request as URLRequest)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
    }

    var detailItem: String? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

