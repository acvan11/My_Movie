//
//  PeopleViewController.swift
//  My_Movie
//
//  Created by Sky on 10/9/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class PeopleViewController: UIViewController {
    
    @IBOutlet weak var listPeopleViewController: UIView!
    @IBOutlet weak var gridPeopleViewController: UIView!
    
    var viewModel = ViewModel()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPeople()
    }
    
    @IBAction func SwitchButtonTapped(_ sender: UIBarButtonItem) {
        
        listPeopleViewController.isHidden.toggle()
        gridPeopleViewController.isHidden.toggle()
    }
    
    func setupPeople() {
   
        searchController.searchBar.placeholder = "Search people name in here..."
        searchController.searchBar.delegate = self
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
    }
    
}

extension PeopleViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        viewModel.getPeople(search: searchText)
        navigationItem.searchController?.isActive = false
    }
}
