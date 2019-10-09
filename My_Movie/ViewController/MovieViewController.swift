//
//  ViewController.swift
//  My_Movie
//
//  Created by Sky on 10/5/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {
    
 
    @IBOutlet weak var gridViewController: UIView!
    @IBOutlet weak var listViewController: UIView!
    
    @IBOutlet weak var movieCollectionView: UICollectionView!
    var viewModel = ViewModel()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMovie()
    }
    
    @IBAction func switchButtonTapped(_ sender: UIBarButtonItem) {
        listViewController.isHidden.toggle()
        gridViewController.isHidden.toggle()
    }
    
    
    func setupMovie() {
        viewModel.getShowtimeMovie()
       searchController.searchBar.placeholder = "Search movie..."
        searchController.searchBar.delegate = self
        navigationItem.hidesSearchBarWhenScrolling = false
               navigationItem.searchController = searchController
               definesPresentationContext = true
      
    }


}



extension MovieViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        navigationItem.searchController?.isActive = false
    }

}
