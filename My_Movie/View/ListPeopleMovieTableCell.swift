//
//  ListPeopleMovieTableCell.swift
//  My_Movie
//
//  Created by Sky on 10/10/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class ListPeopleMovieTableCell: UITableViewCell {

    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var titleMovie: UILabel!
    @IBOutlet weak var overviewMovie: UILabel!
    
    static let identifier = "ListPeopleMovieTableCell"
    
    var popular: Popular! {
        didSet {
            self.titleMovie.text = popular.title
        }
    }
    
}
