//
//  ListMovieTableCell.swift
//  My_Movie
//
//  Created by Sky on 10/9/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class ListMovieTableCell: UITableViewCell {

    @IBOutlet weak var idLabel: UILabel!
    
    static let identifier = "ListMovieTableCell"
    
    var movie: Movie! {
        didSet {
            self.idLabel.text = String(movie.id)
        }
    }
    
}
