//
//  ViewModel.swift
//  My_Movie
//
//  Created by Sky on 10/6/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import Foundation

protocol ShowTimeMovieDelegate: class {
    func update()
}

class ViewModel {
    weak var showtimeDelegate: ShowTimeMovieDelegate?
    
    var showtimeMovies = [Movie]() {
        didSet {
            showtimeDelegate?.update()
        }
    }
    
    func getShowtimeMovie() {
        MovieService.shared.getShowtimeMovie { [weak self] showtimeFilms in
            self?.showtimeMovies = showtimeFilms
            print("showtime movies Count: \(showtimeFilms.count)")
        }
    }
}
