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
    private enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}

struct Movie: Decodable {
    let popularity: Double
    let poster: String?
    let id: Int
    let title: String
    let year: String?
    let overview: String
    
    private enum CodingKeys: String, CodingKey {
        case poster = "poster_path"
        case year = "release_date"
        case popularity, id, title, overview
    }
    
       func getImage(completion: @escaping (UIImage?) -> Void) {
        if poster != nil {
            //the poster url doesn't have a full url
            let image = "https://image.tmdb.org/t/p/w300/" + poster!
            cache.downloadFrom(endpoint: image) { dat in
                if let data = dat {
                    DispatchQueue.main.async {
                        completion(UIImage(data: data))
                    }
                }
            }
        } else {
            completion(nil)
            return
        }
    }
    
    init(from core: CoreMovie) {
        self.id = Int(core.id)
        self.popularity = core.popularity
        self.poster = core.poster
        self.title = core.title ?? ""
        self.year = core.year
        self.overview = core.overview ?? ""
    }
}

