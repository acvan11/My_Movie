//
//  People.swift
//  My_Movie
//
//  Created by Sky on 10/9/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class PeopleResponse: Decodable {
    let people: [People]
    private enum CodingKeys: String, CodingKey {
        case people = "results"
    }
}

struct People: Decodable {
    let famous: String
    let id: Int
    let image: String?
    let gender: Int
    let popularity: Double
    let name: String
    
    private enum CodingKeys: String, CodingKey {
        case famous = "known_for_department"
        case image = "profile_path"
        case id, popularity, gender, name
    }
    
    func getImage(completion: @escaping (UIImage?) -> Void) {
        if image != nil {
            //the poster url doesn't have a full url
            let poster = "https://image.tmdb.org/t/p/w300/" + image!
            cache.downloadFrom(endpoint: poster) { dat in
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
}
