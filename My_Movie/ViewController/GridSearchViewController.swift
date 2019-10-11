//
//  GridSearchViewController.swift
//  My_Movie
//
//  Created by Sky on 10/9/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class GridSearchViewController: UIViewController {


    @IBOutlet weak var gridMovieCV: UICollectionView!
    
    var viewModel = ViewModel() {
        didSet {
            self.gridMovieCV.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupGrid()
    }
    
    func setupGrid() {
        NotificationCenter.default.addObserver(forName: Notification.Name.MovieNotification, object: nil, queue: .main) {[weak self] note in
              guard let userInfo = note.userInfo as? [String:ViewModel] else { return }
              self?.viewModel = userInfo["ViewModel"]!
          }
          
    }
    

}

extension GridSearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.showtimeMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GridMovieCollectionCell.identifier, for: indexPath) as! GridMovieCollectionCell
        let movie = viewModel.showtimeMovies[indexPath.row]
        cell.movie = movie
        return cell
    }
}

extension GridSearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width / 3
        let height = view.frame.height / 6
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         viewModel.movie = viewModel.showtimeMovies[indexPath.row]
         goToDetail(with: viewModel)
    }
}
