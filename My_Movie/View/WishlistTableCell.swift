//
//  WishlistTableCell.swift
//  My_Movie
//
//  Created by Sky on 10/11/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class WishlistTableCell: UITableViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieOverview: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    
    static let identifier = "WishlistTableCell"
    
    var movie: Movie! {
        didSet {
            let year = movie.year?.prefix(4) ?? "No Data"
            self.movieTitle.text = movie.title + " - \(year)"
            self.movieOverview.text = movie.overview
            
            movie.getImage { [weak self] img in
                self?.movieImage.image = img
            }
            
        }
    }
    
}
