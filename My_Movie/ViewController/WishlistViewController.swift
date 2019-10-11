//
//  WishlistViewController.swift
//  My_Movie
//
//  Created by Sky on 10/11/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class WishlistViewController: UIViewController {

    @IBOutlet weak var wishlistTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWishlist()
    }
    
    func setupWishlist() {
        
    }
    

}

extension WishlistTableCell: UITableViewDelegate {
    
}

extension WishlistTableCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WishlistTableCell.identifier, for: indexPath) as! WishlistTableCell
        return cell
    }
}
