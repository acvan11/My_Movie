//
//  ResultCollectionCell.swift
//  My_Movie
//
//  Created by Sky on 10/5/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class ResultCollectionCell: UICollectionViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    
    @IBOutlet weak var movieTitle: UILabel!
    
    static let identifier = "ResultCollectionCell"
    
    
    
    var movie: Movie! {
        didSet {
            movieImage.image = #imageLiteral(resourceName: "1.jpeg")
            movieTitle.text = movie.title
        }
    }

}
