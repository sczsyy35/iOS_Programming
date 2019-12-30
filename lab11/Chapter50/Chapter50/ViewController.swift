//  Name: Yunyan Shi
//  Lab 10: Chapter50
//
//  ViewController.swift
//  Chapter50
//
//  Created by Yunyan Shi on 10/29/19.
//  Copyright © 2019 Yunyan Shi. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    var managedObjectContext: NSManagedObjectContext?
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var status: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initCoreStack()
    }
    
    func initCoreStack() {
        let container = NSPersistentContainer(name: "Chapter50")
        container.loadPersistentStores(completionHandler: {
            (description, error) in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            } else {
                self.managedObjectContext = container.viewContext
            }
        })
    }

    @IBAction func saveContact(_ sender: Any) {
        if let context = managedObjectContext, let entityDescription = NSEntityDescription.entity(forEntityName: "Contacts", in: context) {
            let contact = Contacts(entity: entityDescription, insertInto: managedObjectContext)
            contact.name = name.text
            contact.address = address.text
            contact.phone = phone.text
            do {
                try managedObjectContext?.save()
                name.text = ""
                address.text = ""
                phone.text = ""
                status.text = "Contact Saved"
            } catch let error {
                status.text = error.localizedDescription
            }
        }
    }
    
    @IBAction func findContact(_ sender: Any) {
        if let context = managedObjectContext {
            let entityDescription = NSEntityDescription.entity(forEntityName:
                    "Contacts", in: context)
            let request: NSFetchRequest<Contacts> = Contacts.fetchRequest()
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
                    address.text = match.value(forKey: "address") as? String
                    phone.text = match.value(forKey: "phone") as? String
                    status.text = "Matches found: \(results.count)"
                } else {
                    status.text = "No Match"
                }
            } catch let error {
                status.text = error.localizedDescription
            }
        }
    }
    
    @IBAction func delateAllData(_ sender: Any) {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Contacts")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        do {
            try context.execute(deleteRequest)
            try context.save()
        } catch {
            print("There was an error")
        }
    }
}

