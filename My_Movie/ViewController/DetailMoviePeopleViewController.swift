//
//  DetailMoviePeopleViewController.swift
//  My_Movie
//
//  Created by Sky on 10/10/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class DetailMoviePeopleViewController: UIViewController {

    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var viewModel: ViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDetail()
    }
    
    
    func setupDetail() {
        movieName.text = viewModel.movie.title
        let year = viewModel.movie.year ?? "No data"
        releaseDateLabel.text = "Release Date: " + year
        popularityLabel.text = "Popularity: " + String(viewModel.movie.popularity)
        overviewLabel.text = viewModel.movie.overview
        
        self.viewModel.movie.getImage { [weak self] img in
            self?.movieImage.image = img
        }
    }

}
