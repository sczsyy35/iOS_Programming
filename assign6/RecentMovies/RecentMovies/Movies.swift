//  Name: Yunyan Shi
//  Assignment 6
//
//  Movies.swift
//  RecentMovies
//
//  Created by Yunyan Shi on 11/20/19.
//  Copyright © 2019 Yunyan Shi. All rights reserved.
//

import Foundation

struct Movies: Decodable {
    var results: [MovieDetail]
}

// Define the specific fields that we will use
struct MovieDetail: Decodable {
    var title: String
    var posterPath: String
    var overview: String
    var releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case posterPath = "poster_path"
        case overview
        case releaseDate = "release_date"
    }
}
