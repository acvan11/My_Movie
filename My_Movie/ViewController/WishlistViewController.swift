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
        NotificationCenter.default.addObserver(forName: Notification.Name.WishlistNotification, object: nil, queue: .main) { [weak self] note in
                           guard let userInfo = note.userInfo as? [String:ViewModel] else { return }
                           self?.viewModel = userInfo["ViewModel"]!
                          self?.wishlistTableView.reloadData()
    }
    }

}

extension WishlistViewController: UITableViewDelegate {
    
}

extension WishlistViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CoreManager.shared.load().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WishlistTableCell.identifier, for: indexPath) as! WishlistTableCell
        let movie = viewModel.wishlist[indexPath.row]
        cell.movie = movie
        return cell
    }
}
