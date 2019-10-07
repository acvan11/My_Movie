//
//  MovieService.swift
//  My_Movie
//
//  Created by Sky on 10/6/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import Foundation

typealias MovieHandler = ([Movie]) -> Void

final class MovieService {
    
    static let shared = MovieService()
    private init() {}
    
    func getShowtimeMovie(completion: @escaping MovieHandler) {
        guard let url = MovieAPI().getShowtimeMovieUrl else {
            completion([])
            return
        }
        
        URLSession.shared.dataTask(with: url) { (dat, _, err) in
            if let error = err {
                print("Error: \(error.localizedDescription)")
                completion([])
                return
            }
            
            if let data = dat {
                do {
                    let movieResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
                    let movies = movieResponse.movies
                    completion(movies)
                } catch let myError {
                    print("Couldn't Decode Movie: \(myError.localizedDescription)")
                    completion([])
                    return
                }
            }
        }.resume()
    }
    
    
    
    
}
