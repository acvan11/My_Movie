//
//  ViewController.swift
//  My_Movie
//
//  Created by Sky on 10/5/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {
    
    
    @IBOutlet weak var movieCollectionView: UICollectionView!
    var viewModel: ViewModel!
    
//    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupMovie()
    }
    
    func setupMovie() {

        viewModel?.showtimeDelegate = self
        movieCollectionView.register(UINib(nibName: ResultCollectionCell.identifier, bundle: Bundle.main), forCellWithReuseIdentifier: ResultCollectionCell.identifier)
        
//        searchController.searchBar.placeholder = "Search movie..."
//        searchController.searchBar.delegate = self
//        navigationItem.hidesSearchBarWhenScrolling = false
//               navigationItem.searchController = searchController
//               definesPresentationContext = true
        movieCollectionView.reloadData()
    }


}



extension MovieViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ResultCollectionCell.identifier, for: indexPath) as! ResultCollectionCell
        cell.movieImage?.image = #imageLiteral(resourceName: "1")
//        self.movieCollectionView.reloadData()
        return cell
    }
}

extension MovieViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width / 3
        return CGSize(width: width, height: width)
    }
}

//extension MovieViewController: UISearchBarDelegate {
//
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        guard let searchText = searchBar.text?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
//        navigationItem.searchController?.isActive = false
//    }
//
//}

extension MovieViewController: ShowTimeMovieDelegate {
    func update() {
        DispatchQueue.main.async {
            self.movieCollectionView.reloadData()
        }
    }
}
