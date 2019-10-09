//
//  DetailMovieViewController.swift
//  My_Movie
//
//  Created by Sky on 10/9/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class DetailMovieViewController: UIViewController {

    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    @IBOutlet weak var moviePopularity: UILabel!
    @IBOutlet weak var movieOverview: UILabel!
    
    
    @IBOutlet weak var wishlistButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var viewModel: ViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDetail()
    }

    @IBAction func wishlistButtonTapped(_ sender: UIButton) {
        //TODO
    }
    
    
    @IBAction func FavoriteButtonTapped(_ sender: UIButton) {
        //TODO
    }
    
    func setupDetail() {
        movieTitle.text = viewModel.movie.title
        movieReleaseDate.text = "Release Date: " + viewModel.movie.year!
        moviePopularity.text = "Popularity: " + String(viewModel.movie.popularity)
        movieOverview.text = viewModel.movie.overview
        
        viewModel.movie.getImage { [weak self] image in
            self?.moviePoster.image = image
        }
    }
    
}
