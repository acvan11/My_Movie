//
//  DetailPeopleViewController.swift
//  My_Movie
//
//  Created by Sky on 10/9/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class DetailPeopleViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imagePeople: UIImageView!
    @IBOutlet weak var Occupation: UILabel!
    
    @IBOutlet weak var peopleTableView: UITableView!
    
    var viewModel: ViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupListPeopleMovies()
    }
    
    func setupListPeopleMovies() {
      //  nameLabel.text = viewModel
    }
    

}

extension DetailPeopleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension DetailPeopleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListPeopleMovieTableCell.identifier, for: indexPath) as! ListPeopleMovieTableCell
        return cell
    }
}
