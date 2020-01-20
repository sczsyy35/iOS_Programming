//  Name: Yunyan Shi
//  CIS 137
//  Midterm Project: Chinese Zodiac
//
//  ZodiacTableViewController.swift
//  ChineseZodiac
//
//  Created by Yunyan Shi on 10/20/19.
//  Copyright © 2019 Yunyan Shi. All rights reserved.
//

import UIKit

class ZodiacTableViewController: UITableViewController {
    
    var names = [String]()
    var images = [String]()
    var years = [String]()
    var traits = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }

    func initialize() {
        // place the data of the animals in arrays
        names = ["Rat", "Ox", "Tiger", "Rabbit", "Dragon", "Snake", "Horse", "Goat", "Monkey", "Rooster", "Dog", "Pig"]
        images = ["rat.jpg", "ox.jpg", "tiger.jpg", "rabbit.jpg", "dragon.jpg", "snake.jpg", "horse.jpg", "goat.jpg", "monkey.jpg", "rooster.jpg", "dog.jpg", "pig.jpg"]
        years = ["2008, 1996, 1984, 1972, 1960", "2009, 1997, 1985, 1973, 1961", "2010, 1998, 1986, 1974, 1962", "2011, 1999, 1987, 1975, 1963", "2012, 2000, 1988, 1976, 1964", "2013, 2001, 1989, 1977, 1965", "2014, 2002, 1990, 1978, 1966", "2015, 2003, 1991, 1979, 1967", "2016, 2004, 1992, 1980, 1968", "2017, 2005, 1993, 1981, 1969", "2018, 2006, 1994, 1982, 1970", "2019, 2007, 1995, 1983, 1971"]
        traits = ["Intelligent, adaptable, quick-witted, charming, artistic, sociable", "Loyal, reliable, thorough, strong, reasonable, steady, determined", "Enthusiastic, courageous, ambitious, leadership, confidence, charismatic", "Trustworthy, empathic, modest, diplomatic, sincere, sociable, caretakers", "Lucky, flexible, eccentric, imaginative, artistic, spiritual, charismatic", "Philosophical, organized, intelligent, intuitive, elegant, attentive, decisive", "Adaptable, loyal, courageous, ambitious, intelligent, adventurous, strong", "Tasteful, crafty, warm, elegant, charming, intuitive, sensitive, calm", "Quick-witted, charming, lucky, adaptable, bright, versatile, lively, smart", "Honest, energetic, intelligent, flamboyant, flexible, diverse, confident", "Loyal, sociable, courageous, diligent, steady, lively, adaptable, smart", "Honorable, philanthropic, determined, optimistic, sincere, sociable"]
        tableView.estimatedRowHeight = 80
        
        // Apply a large text size to the navigation title
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    // Each cell displays an image and an animal name
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ZodiacTableCell", for: indexPath) as! ZodiacTableViewCell
        cell.zodiacLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline)
        cell.zodiacLabel.text = names[indexPath.row]
        cell.zodiacImage.image = UIImage(named: images[indexPath.row])
        return cell
    }
    
    // Use a segue to transer the data of the animal selected by the user to the ZodiacDetailViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAnimalDetails" {
            let detailViewController = segue.destination as! ZodiacDetailViewController
            let myIndexPath = self.tableView.indexPathForSelectedRow!
            let row = myIndexPath.row
            detailViewController.names = names[row]
            detailViewController.images = images[row]
            detailViewController.years = years[row]
            detailViewController.traits = traits[row]
        }
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
}
