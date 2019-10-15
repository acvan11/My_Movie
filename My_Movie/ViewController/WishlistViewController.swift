//
//  WishlistViewController.swift
//  My_Movie
//
//  Created by Sky on 10/11/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class WishlistViewController: UIViewController {

    var viewModel = ViewModel()
    
    @IBOutlet weak var wishlistTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWishlist()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getWishlist()
    }
    
    func setupWishlist() {
           wishlistTableView.register(UINib(nibName: ListMovieTableCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: ListMovieTableCell.identifier)
        wishlistTableView.tableFooterView = UIView(frame: .zero)
        NotificationCenter.default.addObserver(forName: Notification.Name.WishlistNotification, object: nil, queue: .main) { [weak self] note in
                           guard let userInfo = note.userInfo as? [String:ViewModel] else { return }
                           self?.viewModel = userInfo["ViewModel"]!
                          self?.wishlistTableView.reloadData()
    }
    }
    
    

    
}

extension WishlistViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let movie = viewModel.wishlist[indexPath.row]
        viewModel.movie = movie
        print(movie.title)
        goToDetail(with: viewModel)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}

extension WishlistViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.wishlist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListMovieTableCell.identifier, for: indexPath) as! ListMovieTableCell
        let movie = viewModel.wishlist[indexPath.row]
        cell.movie = movie
        return cell
    }
}
