//  Name: Yunyan Shi
//  Lab 10
//
//  ViewController.swift
//  Chapter39
//
//  Created by Yunyan Shi on 10/21/19.
//  Copyright © 2019 Yunyan Shi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textBox: UITextField!
    
    var fileMgr: FileManager = FileManager.default
    var docsDir: String?
    var dataFile: String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkFile()
    }
    
    func checkFile() {
        let dirPaths = fileMgr.urls(for: .documentDirectory, in: .userDomainMask)
        dataFile = dirPaths[0].appendingPathComponent("datafile.dat").path
        if fileMgr.fileExists(atPath: dataFile) {
            if let databuffer = fileMgr.contents(atPath: dataFile) {
                let dataString = NSString(data: databuffer, encoding: String.Encoding.utf8.rawValue)
                textBox.text = dataString as String?
            }
        }
    }
    
    @IBAction func saveText(_ sender: Any) {
        if let text = textBox?.text {
            let dataBuffer = text.data(using: String.Encoding.utf8)
            fileMgr.createFile(atPath: dataFile, contents: dataBuffer, attributes: nil)
        }
    }


}

