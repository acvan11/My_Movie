//
//  PeopleViewController.swift
//  My_Movie
//
//  Created by Sky on 10/9/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class PeopleViewController: UIViewController {
    
    @IBOutlet weak var listPeopleViewController: UIView!
    @IBOutlet weak var gridPeopleViewController: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SwitchButtonTapped(_ sender: UIBarButtonItem) {
        
        listPeopleViewController.isHidden.toggle()
        gridPeopleViewController.isHidden.toggle()
    }
    
}
