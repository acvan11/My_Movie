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
    var people: People!
    
    var showtimeMovies = [Movie]() {
        didSet {
            let userInfo: [String:ViewModel] = ["ViewModel":self]
            NotificationCenter.default.post(name: Notification.Name.MovieNotification, object: nil, userInfo: userInfo)
        }
    }
    
    var listPeople = [People]() {
        didSet {
            let userInfo: [String:ViewModel] = ["ViewModel":self]
            NotificationCenter.default.post(name: Notification.Name.SearchPeopleNotification, object: nil, userInfo: userInfo)
        }
    }
    
    var moviePeople = [Movie]() {
        didSet {
            let userInfo: [String:ViewModel] = ["ViewModel":self]
            NotificationCenter.default.post(name: Notification.Name.MoviePeopleNotification, object: nil, userInfo: userInfo)
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
             print("List of movies Count: \(searchingFilms.count)")
         }
     }
    
    func getPeople(search: String) {
        MovieService.shared.getSearchingPeople(for: search) { [weak self] searchingPeople in
            self?.listPeople = searchingPeople
                 print("People Count: \(searchingPeople.count)")
             }
    }
    
    func getMoviePeople(search: String) {
        MovieService.shared.getListMoviePeople(for: search) { [weak self] movies in
            self?.moviePeople = movies
            print("Movie People count: \(movies.count)")
        }
    }
}
