//
//  MovieAPI.swift
//  My_Movie
//
//  Created by Sky on 10/5/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import Foundation

/*
 Search person -> get id:
 https://api.themoviedb.org/3/search/person?query=tom&api_key=2d7ee23b63ad65858ab3e85df256371c
 
 From person id -> get all movies:
 https://api.themoviedb.org/3/discover/movie?with_cast=1245&api_key=2d7ee23b63ad65858ab3e85df256371c
 
 Display showtime movies:
 https://api.themoviedb.org/3/discover/movie?primary_release_date.gte=2019-08-15&primary_release_date.lte=now&api_key=2d7ee23b63ad65858ab3e85df256371c
 
 Display most popularity movies:
 https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=2d7ee23b63ad65858ab3e85df256371c
 
 Search movie:
 https://api.themoviedb.org/3/search/movie?query=titanic&api_key=2d7ee23b63ad65858ab3e85df256371c
 
 display image:
 https://image.tmdb.org/t/p/w300/ip7aXVH8s6wXv8cY6KI14OZgCI8.jpg
 */

struct MovieAPI {
    //  https://api.themoviedb.org/3/discover/movie?primary_release_date.gte=2019-08-15&primary_release_date.lte=now&api_key=2d7ee23b63ad65858ab3e85df256371c
    
    let base = "https://api.themoviedb.org/3/"
    let showtime = "discover/movie?primary_release_date.gte=2019-08-15&primary_release_date.lte=now&"
    let apiKey = "&api_key=2d7ee23b63ad65858ab3e85df256371c"
    
    var getShowtimeMovieUrl: URL? {
        return URL(string: base + showtime + apiKey)
    }
    
    
    
}
