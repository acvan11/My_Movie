//
//  ViewController+Extension.swift
//  My_Movie
//
//  Created by Sky on 10/9/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

extension UIViewController {
    func goToDetail(with vm: ViewModel) {
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailMovieViewController") as! DetailMovieViewController
               detailVC.viewModel = vm
               navigationController?.pushViewController(detailVC, animated: true)
               
    }
}
