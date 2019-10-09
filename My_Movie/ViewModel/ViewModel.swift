//
//  ViewModel.swift
//  My_Movie
//
//  Created by Sky on 10/6/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import Foundation

class ViewModel {
    
    var movie: Movie!
    
    var showtimeMovies = [Movie]() {
        didSet {
            let userInfo: [String:ViewModel] = ["ViewModel":self]
            NotificationCenter.default.post(name: Notification.Name.MovieNotification, object: nil, userInfo: userInfo)
        }
    }
    
    
    func getShowtimeMovie(search: String) {
        MovieService.shared.getShowtimeMovie(for: search) { [weak self] showtimeFilms in
            self?.showtimeMovies = showtimeFilms
            print("showtime movies Count: \(showtimeFilms.count)")
        }
    }
    
    func getSearchingMovie(search: String) {
         MovieService.shared.getSearchingMovie(for: search) { [weak self] searchingFilms in
             self?.showtimeMovies = searchingFilms
             print("showtime movies Count: \(searchingFilms.count)")
         }
     }
}
