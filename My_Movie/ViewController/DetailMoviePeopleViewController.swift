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
    
    
    @IBAction func wishlistButtonTapped(_ sender: UIButton) {
        //TODO
    }
    
    @IBAction func favoriteButtonTapped(_ sender: UIButton) {
    }
    
    func setupDetail() {
        movieName.text = viewModel.movie.title
        releaseDateLabel.text = "Release Date: " + viewModel.movie.year!
        popularityLabel.text = "Popularity: " + String(viewModel.movie.popularity)
        overviewLabel.text = viewModel.movie.overview
        
        self.viewModel.movie.getImage { [weak self] img in
            self?.movieImage.image = img
        }
    }

}
