//
//  ListMovieTableCell.swift
//  My_Movie
//
//  Created by Sky on 10/9/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class ListMovieTableCell: UITableViewCell {

    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieOverview: UILabel!
    @IBOutlet weak var moviePoster: UIImageView!
    
    static let identifier = "ListMovieTableCell"
    
    var movie: Movie! {

        didSet {
            //only display the year release,not month and day
            let year = movie.year?.prefix(4) ?? "No Data"
            self.movieTitle.text = movie.title + " - \(year)"
            self.movieOverview.text = movie.overview
            movie.getImage { [weak self] image in
                self?.moviePoster.image = image
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        movieTitle.text = nil
        movieOverview.text = nil
        moviePoster.image = nil
    }
    
}
