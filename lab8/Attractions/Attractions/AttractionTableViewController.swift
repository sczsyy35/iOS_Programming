//  Name: Yunyan Shi
//
//  AttractionTableViewController.swift
//  Attractions
//
//  Created by Yunyan Shi on 10/6/19.
//  Copyright © 2019 Yunyan Shi. All rights reserved.
//

import UIKit

class AttractionTableViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate {
    
    var attractionImages = [String]()
    var attractionNames = [String]()
    var webAddresses = [String]()
    
    var searching = false
    var matches = [Int]()
    let searchController = UISearchController(searchResultsController: nil)
        
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    func initialize(){
        attractionNames = ["Buckingham Palance", "The Eiffel Tower", "The Grand Canyon", "Windsor Castle", "Empire State Buidling"]
        webAddresses = ["https://en.wikipedia.org/wiki/Buckingham_Palace", "https://en.wikipedia.org/wiki/Eiffel_Tower", "https://en.wikipedia.org/wiki/Grand_Canyon", "https://en.wikipedia.org/wiki/Windsor_Castle", "https://en.wikipedia.org/wiki/Empire_State_Building"]
        attractionImages = ["buckingham_palace.jpg", "eiffel_tower.jpg", "grand_canyon.jpg", "windsor_castle.jpg", "empire_state_building.jpg"]
        tableView.estimatedRowHeight = 50
        navigationController?.navigationBar.prefersLargeTitles = true
        
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Attractions"
        
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searching ? matches.count : attractionNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "AttractionTableCell", for: indexPath) as! AttractionTableViewCell
        let row = indexPath.row
        cell.attractionLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline)
        
        cell.attractionLabel.text = searching ? attractionNames[matches[row]] : attractionNames[row]
        let imageName = searching ? attractionImages[matches[row]] : attractionImages[row]
        cell.attractionImage.image = UIImage(named: imageName)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let configuration = UISwipeActionsConfiguration(actions: [UIContextualAction(style: .destructive, title: "Delete", handler: {(action, view, completionHandler) in
        let row = indexPath.row
        if self.searching{
            self.attractionNames.remove(at: self.matches[row])
            self.attractionImages.remove(at: self.matches[row])
            self.webAddresses.remove(at: self.matches[row])
            self.matches.remove(at: indexPath.row)
            self.updateSearchResults(for: self.searchController)
        } else {
            self.attractionNames.remove(at: row)
            self.attractionImages.remove(at: row)
            self.webAddresses.remove(at: row)
        }
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


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowAttractionDetails" {
            let detailViewController = segue.destination as! AttractionDetailViewController
            let myIndexPath = self.tableView.indexPathForSelectedRow!
            let row = myIndexPath.row
            detailViewController.website = searching ? webAddresses[matches[row]] : webAddresses[row]
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            matches.removeAll()
            
            for index in 0..<attractionNames.count {
                if attractionNames[index].lowercased().contains(searchText.lowercased()) {
                    matches.append(index)
                }
            }
            searching = true
        } else {
            searching = false
        }
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        tableView.reloadData()
    }
}
