//
//  ListSearchViewController.swift
//  My_Movie
//
//  Created by Sky on 10/9/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class ListSearchViewController: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    
    var viewModel = ViewModel() {
        didSet {
            self.listTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupList()
    }
    
    
    func setupList() {
        listTableView.register(UINib(nibName: ListMovieTableCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: ListMovieTableCell.identifier)
        
        listTableView.tableFooterView = UIView(frame: .zero)
        
        NotificationCenter.default.addObserver(forName: Notification.Name.MovieNotification, object: nil, queue: .main) { note in
            guard let userInfo = note.userInfo as? [String:ViewModel] else { return }
            self.viewModel = userInfo["ViewModel"]!
        }
    }
}

extension ListSearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //TODO:
        return viewModel.showtimeMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListMovieTableCell.identifier, for: indexPath) as! ListMovieTableCell
        //TODO
        let movie = viewModel.showtimeMovies[indexPath.row]
        cell.movie = movie
        return cell
    }
}

extension ListSearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
