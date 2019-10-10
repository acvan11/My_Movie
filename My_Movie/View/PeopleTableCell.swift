//
//  PeopleTableCell.swift
//  My_Movie
//
//  Created by Sky on 10/9/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class PeopleTableCell: UITableViewCell {
 
    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var occupationLabel: UILabel!
    
    @IBOutlet weak var peopleImage: UIImageView!
    
    static let identifier = "PeopleTableCell"
    
    var people: People! {
        didSet {
            self.labelName.text = people.name
            self.occupationLabel.text = people.famous
            
             people.getImage { [weak self] image in
                           self?.peopleImage.image = image
                       }
        }
    }
}
