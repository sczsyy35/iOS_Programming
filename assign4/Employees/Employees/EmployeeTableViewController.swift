//  Name: Yunyan Shi
//  Assignment 4
//
//  EmployeeTableViewController.swift
//  Employees
//
//  Created by Yunyan Shi on 10/6/19.
//  Copyright © 2019 Yunyan Shi. All rights reserved.
//

import UIKit

class EmployeeTableViewController: UITableViewController {
    
    var employeeNames = [String]()
    var employeeJobTitles = [String]() // Add one more variable
    var employeeImages = [String]()
   
        
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    func initialize() {
        employeeNames = ["Pamela Beesly", "Andy Bernard", "Creed Bratton", "Toby Flenderson", "Jim Halpert", "Ryan Howard", "Stanley Hudson", "Kelly Kapoor", "Phyllis Lapin", "Kevin Malone", "Angela Martin", "Oscar Martinez", "Meredith Palmer", "Dwight Schrute", "Michael Scott"]
       
        // Create another array to store job titles
        employeeJobTitles = ["Receptionist", "Sales Director", "Quality Assurance", "Human Resources Manager", "Assistant Regional Manager", "Vice President, North East", "Sales Representative", "Customer Service Rep.", "Sales Representative", "Accountant", "Senior Accountant", "Accountant", "Supplier Relations", "Assistant Regional Manager", "Regional Manager"]
        
        employeeImages = ["pamela_beesly.jpg", "andy_bernard.jpg", "creed_bratton.jpg", "toby_flenderson.jpg", "jim_halpert.jpg", "ryan_howard.jpg", "stanley_hudson.jpg", "kelly_kapoor.jpg", "phyllis_lapin.jpg", "kevin_malone.jpg", "angela_martin.jpg", "oscar_martinez.jpg", "meredith_palmer.jpg", "dwight_schrute.jpg", "michael_scott.jpg"]
   
        tableView.estimatedRowHeight = 50
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeNames.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "EmployeeTableCell", for: indexPath) as!EmployeeTableViewCell
        
        
        cell.employeeLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline)
        
        cell.employeeTitle.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.subheadline)

        
        cell.employeeLabel.text = employeeNames[indexPath.row]
        
        // Assign the job titles stored in the array to the label employeeTitle
        cell.employeeTitle.text = employeeJobTitles[indexPath.row]
        
        cell.employeeImage.image = UIImage(named: employeeImages[indexPath.row])
        
        return cell
    }
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let configuration = UISwipeActionsConfiguration(actions: [UIContextualAction(style: .destructive, title: "Delete", handler: {(action, view, completionHandler) in
            let row = indexPath.row
            self.employeeNames.remove(at: row)
            self.employeeJobTitles.remove(at: row) 
            self.employeeImages.remove(at: row)
            completionHandler(true)
            tableView.reloadData()
        })
            ])
        return configuration
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
