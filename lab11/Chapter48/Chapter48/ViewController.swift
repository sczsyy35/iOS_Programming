//
//  ViewController.swift
//  Chapter48
//
//  Created by Yunyan Shi on 11/11/19.
//  Copyright © 2019 Yunyan Shi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var address: UITextField!
    
    @IBOutlet weak var phone: UITextField!
    
    @IBOutlet weak var status: UILabel!
    
    var databasePath = String()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initDB()
    }
    
    func initDB() {
        let filemgr = FileManager.default
        let dirPaths = filemgr.urls(for:  .documentDirectory, in: .userDomainMask)
        databasePath = dirPaths[0].appendingPathComponent("contacts.db").path
        if !filemgr.fileExists(atPath: databasePath) {
            let contactDB = FMDatabase(path: databasePath)
            if (contactDB.open()) {
                let sql_stmt = "CREATE TABLE IF NOT EXISTS CONTACTS (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, ADDRESS TEXT, PHONE TEXT)"
                if !(contactDB.executeStatements(sql_stmt)) {
                    print("Error: \(contactDB.lastErrorMessage())")
                }
                contactDB.close()
            } else {
                print("Error: \(contactDB.lastErrorMessage())")
            }
        }
    }
    
    @IBAction func saveContact(_ sender: Any) {
        let contactDB = FMDatabase(path: databasePath)
        if (contactDB.open()) {
            let insertSQL = "INSERT INTO CONTACTS (name, address, phone) VALUES ('\(name.text ?? "")', '\(address.text ?? "")', '\(phone.text ?? "")')"
            do {
                try contactDB.executeUpdate(insertSQL, values: nil)
            } catch {
                status.text = "Failed to add contact"
                print("Error: \(error.localizedDescription)")
            }
            status.text = "Contact Added"
            name.text = ""
            address.text = ""
            phone.text = ""
        } else {
            print("Error: \(contactDB.lastErrorMessage())")
        }
    }
    
    @IBAction func findContact(_ sender: Any) {
        let contactDB = FMDatabase(path: databasePath)
        if (contactDB.open()) {
            let querySQL = "SELECT address, phone FROM CONTACTS WHERE name = '\(name.text!)'"
            do {
                let results: FMResultSet? = try contactDB.executeQuery(querySQL, values: nil)
                if results?.next() == true {
                    address.text = results?.string(forColumn: "address")
                    phone.text = results?.string(forColumn: "phone")
                    status.text = "Record Found"
                } else {
                    status.text = "Record not found"
                    address.text = ""
                    phone.text = ""
                }
            } catch {
                print("Error: \(error.localizedDescription)")
            }
            contactDB.close()
        } else {
            print("Error: \(contactDB.lastErrorMessage())")
        }
    }



}

