//  Name: Yunyan Shi
//  Assignment 5: EmployeeData
//
//  ViewController.swift
//  EmployeeData
//
//  Created by Yunyan Shi on 10/31/19.
//  Copyright © 2019 Yunyan Shi. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    var managedObjectContext: NSManagedObjectContext?

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var position: UITextField!
    @IBOutlet weak var department: UITextField!
    @IBOutlet weak var status: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initCoreStack()
    }
    
    func initCoreStack() {
        let container = NSPersistentContainer(name: "EmployeeData")
        container.loadPersistentStores(completionHandler: {
            (description, error) in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            } else {
                self.managedObjectContext = container.viewContext
            }
        })
    }

    
    @IBAction func saveEmployee(_ sender: Any) {
        if let context = managedObjectContext, let entityDescription = NSEntityDescription.entity(forEntityName: "Employees", in: context) {
            let employee = Employees(entity: entityDescription, insertInto: managedObjectContext)
            employee.name = name.text
            employee.position = position.text
            employee.department = department.text
            do {
                try managedObjectContext?.save()
                name.text = ""
                position.text = ""
                department.text = ""
                status.text = "Employee Saved"
            } catch let error {
                status.text = error.localizedDescription
            }
        }
    }
    
    @IBAction func findEmployee(_ sender: Any) {
        if let context = managedObjectContext {
            let entityDescription = NSEntityDescription.entity(forEntityName:
                "Employees", in: context)
            let request: NSFetchRequest<Employees> = Employees.fetchRequest()
            request.entity = entityDescription
            if let name = name.text {
                let pred = NSPredicate(format: "(name = %@)", name)
                request.predicate = pred
            }
            do {
                var results = try context.fetch(request as! NSFetchRequest<NSFetchRequestResult>)
                if results.count > 0 {
                    let match = results[0] as!NSManagedObject
                    name.text = match.value(forKey: "name") as? String
                    position.text = match.value(forKey: "position") as? String
                    department.text = match.value(forKey: "department") as? String
                    status.text = "Matches found: \(results.count)"
                } else {
                    status.text = "No Match"
                }
            } catch let error {
                status.text = error.localizedDescription
            }
        }
    }
}

