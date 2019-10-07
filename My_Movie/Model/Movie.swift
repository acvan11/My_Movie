//
//  Movie.swift
//  My_Movie
//
//  Created by Sky on 10/5/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class MovieResponse: Decodable {
    let movies: [Movie]
    private enum Codingkeys: String, CodingKey {
        case movies = "results"
    }
}

struct Movie: Decodable {
    let popularity: Int32
    let poster: String
    let id: Int
    let title: String
    let year: String
    let overview: String
    
    private enum CodingKeys: String, CodingKey {
        case poster = "poster_path"
        case year = "release_date"
        case popularity, id, title, overview
    }
}
