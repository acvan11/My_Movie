//
//  MovieService.swift
//  My_Movie
//
//  Created by Sky on 10/6/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import Foundation

typealias MovieHandler = ([Movie]) -> Void
typealias PeopleHandler = ([People]) -> Void

final class MovieService {
    
    static let shared = MovieService()
    private init() {}
    
    // Get the showtime movies which are currently screened at the movie theaters
    func getShowtimeMovie(for search: String, completion: @escaping MovieHandler) {
        guard let url = MovieAPI(search: search).getShowtimeMovieUrl else {
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
    
    // Get the list of related movies when user searches a movie
    func getSearchingMovie(for search: String, completion: @escaping MovieHandler) {
           guard let url = MovieAPI(search: search).getSearchingMovieUrl else {
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
    
    // Get the list of related people when user searches a person
    
    func getSearchingPeople(for search: String, completion: @escaping PeopleHandler) {
            guard let url = MovieAPI(search: search).getPeopleUrl else {
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
                        let peopleResponse = try JSONDecoder().decode(PeopleResponse.self, from: data)
                        let people = peopleResponse.people
                        completion(people)
                    } catch let myError {
                        print("Couldn't Decode People: \(myError.localizedDescription)")
                        completion([])
                        return
                    }
                }
            }.resume()
        }
    
     func getListMoviePeople(for search: String, completion: @escaping MovieHandler) {
             guard let url = MovieAPI(search: search).getMoviePeopleUrl else {
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
                         let moviePeopleResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
                         let moviePeople = moviePeopleResponse.movies
                         completion(moviePeople)
                     } catch let myError {
                         print("Couldn't Decode People: \(myError.localizedDescription)")
                         completion([])
                         return
                     }
                 }
             }.resume()
         }
    
    
}
