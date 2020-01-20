//  Name: Yunyan Shi
//  Assignment 6
//
//  MoviesRequest.swift
//  RecentMovies
//
//  Created by Yunyan Shi on 11/20/19.
//  Copyright © 2019 Yunyan Shi. All rights reserved.
//

import Foundation

enum MovieError: Error {
    case noDataAvailable
    case canNotProcessData
}

struct MovieRequest {
    let resourceURL: URL
    let API_KEY = "2e0f306f867b77bd48401cf62abded79"
    
    // Non-arg constructor: generate resource URL
    init() {
        let resourceString = "https://api.themoviedb.org/3/movie/upcoming?api_key=\(API_KEY)"
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        self.resourceURL = resourceURL
    }
    
   
    func getMovies (completion: @escaping(Result<[MovieDetail], MovieError>) -> Void) {
        //  Fetch JSON data from the server of TMDB
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            do {
                // Convert JSON into array
                let decoder = JSONDecoder()
                let movieResults = try decoder.decode(Movies.self, from: jsonData)
                let movieDetails = movieResults.results
                completion(.success(movieDetails))
            } catch {
                completion(.failure(.canNotProcessData))
            }
        }
        dataTask.resume()
    }
}

