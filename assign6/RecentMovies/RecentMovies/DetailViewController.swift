//  Name: Yunyan Shi
//  Assignment 6
//
//  DetailViewController.swift
//  RecentMovies
//
//  Created by Yunyan Shi on 11/20/19.
//  Copyright © 2019 Yunyan Shi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var theMovie: MovieDetail?
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDate: UILabel!
    @IBOutlet weak var movieOverview: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        movieTitle.text = theMovie?.title
        movieDate.text = theMovie?.releaseDate
        movieOverview.text = theMovie?.overview
        let urlString = "https://image.tmdb.org/t/p/w300" + theMovie!.posterPath
        let url = URL(string: urlString)
        let data = try? Data(contentsOf: url!)
        if let imageData = data {
            let image = UIImage(data: imageData)
            movieImage.image = image
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
