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
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var peopleTableView: UITableView!
    
    var viewModel: ViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupListPeopleMovies()
    }
    
    func setupListPeopleMovies() {
       nameLabel.text = viewModel.people.name
            Occupation.text = "Famous For: \(viewModel.people.famous)"
            labelText.text = "List of movies made by \(nameLabel.text!)"
            
            self.viewModel.people.getImage { [weak self] img in
                self?.imagePeople.image = img
            }
                peopleTableView.register(UINib(nibName: ListMovieTableCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: ListMovieTableCell.identifier)
                     
                     peopleTableView.tableFooterView = UIView(frame: .zero)
                     
                     NotificationCenter.default.addObserver(forName: Notification.Name.MoviePeopleNotification, object: nil, queue: .main) { note in
                         guard let userInfo = note.userInfo as? [String:ViewModel] else { return }
                         self.viewModel = userInfo["ViewModel"]!
            }
    }
    

}

extension DetailPeopleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         tableView.deselectRow(at: indexPath, animated: true)
               viewModel.movie = viewModel.moviePeople[indexPath.row]
                goToMoviePeopleDetail(with: viewModel)
    }
}

extension DetailPeopleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.moviePeople.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListMovieTableCell.identifier, for: indexPath) as! ListMovieTableCell
        let movie = viewModel.moviePeople[indexPath.row]
        cell.movie = movie
        return cell
    }
}
