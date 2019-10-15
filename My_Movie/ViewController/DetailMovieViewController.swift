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

//    func wishlistButtonText() {
////        let movie = viewModel.movie
//
//    }
    
    @IBAction func wishlistButtonTapped(_ sender: UIButton) {
        let movie = viewModel.movie
        viewModel.getWishlist()
//        viewModel.add(movie: movie!)
//        viewModel.isInWishlist(movie: movie!)
        if !viewModel.isInWishlist(movie: movie!) {
            viewModel.add(movie: movie!)
        } else {
            let wishlistAlert = UIAlertController(title: "Ooppss!!!", message: "Sorry!!! This movie is already in the wishlist", preferredStyle: .alert)
                                  let okayAction = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
                                  wishlistAlert.addAction(okayAction)
                                     present(wishlistAlert, animated: true, completion: nil)

        }
    }
    
    
    @IBAction func FavoriteButtonTapped(_ sender: UIButton) {
        //TODO
    }
    
    func setupDetail() {
        
        movieTitle.text = viewModel.movie.title
         let year = viewModel.movie.year ?? "No data"
        movieReleaseDate.text = "Release Date: " + year
        moviePopularity.text = "Popularity: " + String(viewModel.movie.popularity)
        movieOverview.text = viewModel.movie.overview
        
        viewModel.movie.getImage { [weak self] image in
            self?.moviePoster.image = image
        }
    }
    
}
