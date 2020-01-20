//  Name: Yunyan Shi
//  Assignment 6
//
//  TableViewController.swift
//  RecentMovies
//
//  Created by Yunyan Shi on 11/20/19.
//  Copyright © 2019 Yunyan Shi. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var listOfMovies = [MovieDetail]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    
    func initialize() {
        navigationController?.navigationBar.prefersLargeTitles = true
        // Fetch data
        MovieRequest().getMovies { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let movies):
                self?.listOfMovies = movies
            }
        }
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfMovies.count
    }


    // Display the poseter, the title and the release date of each movie
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! TableViewCell
        let movie = listOfMovies[indexPath.row]
        cell.movieTitle.text = movie.title
        cell.movieData.text = movie.releaseDate
        let urlStr = "https://image.tmdb.org/t/p/w300" + movie.posterPath
        let url = URL(string: urlStr)!
        let data = try? Data(contentsOf: url)
        if let imageData = data {
            let image = UIImage(data: imageData)
            cell.movieImage.image = image
        }
        return cell
    }
    
    
    // Pass the data of the movie selected by the user to the DetailViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMovieDetails" {
            let detailViewController = segue.destination as! DetailViewController
            let myIndexPath = self.tableView.indexPathForSelectedRow!
            let theMovie = listOfMovies[myIndexPath.row]
            detailViewController.theMovie = theMovie
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
