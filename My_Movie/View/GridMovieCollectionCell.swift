//
//  GridMovieCollectionCell.swift
//  My_Movie
//
//  Created by Sky on 10/10/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class GridMovieCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    
    static let identifier = "GridMovieCollectionCell"
    
    var movie: Movie! {
        didSet {
            self.movieTitle.text = movie.title
            
            movie.getImage { [weak self] img in
                self?.movieImage.image = img
            }
        }
    }
}
