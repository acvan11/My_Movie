//
//  ListPeopleViewController.swift
//  My_Movie
//
//  Created by Sky on 10/9/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class ListPeopleViewController: UIViewController {

    @IBOutlet weak var listPeopleTableView: UITableView!

    
    @IBOutlet weak var peopleLabel: UILabel!
    var viewModel = ViewModel() {
        didSet {
            self.listPeopleTableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupListPeople()
    }
    
    func setupListPeople() {

           
           NotificationCenter.default.addObserver(forName: Notification.Name.SearchPeopleNotification, object: nil, queue: .main) { note in
               guard let userInfo = note.userInfo as? [String:ViewModel] else { return }
               self.viewModel = userInfo["ViewModel"]!
        
    }
            listPeopleTableView.tableFooterView = UIView(frame: .zero)

}
}

extension ListPeopleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = viewModel.listPeople.count
        
        if count > 0 {
            peopleLabel.text = "There are \(count) people"
        } else {
            peopleLabel.text = "There is no result"
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PeopleTableCell.identifier, for: indexPath) as! PeopleTableCell
        let person = viewModel.listPeople[indexPath.row]
        cell.people = person
        return cell
    }
    

}

extension ListPeopleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
