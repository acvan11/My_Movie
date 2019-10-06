//
//  ViewController.swift
//  My_Movie
//
//  Created by Sky on 10/5/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {
    
    
    @IBOutlet weak var movieTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupMovie()
    }
    
    func setupMovie() {
        movieTableView.register(UINib(nibName: SearchBarTableCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: SearchBarTableCell.identifier)
        
        movieTableView.register(UINib(nibName: ResultCollectionCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: ResultCollectionCell.identifier)
    
    }


}

extension MovieViewController: UITableViewDelegate {
    
}

extension MovieViewController: UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
//
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        switch indexPath.section {
//        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: SearchBarTableCell.identifier, for: indexPath) as! SearchBarTableCell
            return cell
//        default:
//            let cell = tableView.dequeueReusableCell(withIdentifier: ResultCollectionCell.identifier, for: indexPath) as! ResultCollectionCell
//
//            return cell
//        }
    }
}

extension MovieViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ResultCollectionCell.identifier, for: indexPath) as! ResultCollectionCell
        cell.movieImage?.image = #imageLiteral(resourceName: "1")
        return cell
    }
}

extension MovieViewController: UICollectionViewDelegateFlowLayout {
    
}
