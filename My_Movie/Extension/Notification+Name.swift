//
//  Notification+Name.swift
//  My_Movie
//
//  Created by Sky on 10/9/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import Foundation

extension Notification.Name {
    static let MovieNotification = Notification.Name("Movies")
    static let SearchMovieNotification = Notification.Name("SearchingMovies")
    static let SearchPeopleNotification = Notification.Name("SearchingPeople")
        static let MoviePeopleNotification = Notification.Name("MoviePeople")
}
