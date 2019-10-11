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
    
    func goToPeopleDetail(with vm: ViewModel) {
           let detailPeopleVC = storyboard?.instantiateViewController(withIdentifier: "DetailPeopleViewController") as! DetailPeopleViewController
                  detailPeopleVC.viewModel = vm
                  navigationController?.pushViewController(detailPeopleVC, animated: true)
                  
       }
    
    func goToMoviePeopleDetail(with vm: ViewModel) {
           let detailMoviePeopleVC = storyboard?.instantiateViewController(withIdentifier: "DetailMoviePeopleViewController") as! DetailMoviePeopleViewController
                  detailMoviePeopleVC.viewModel = vm
                  navigationController?.pushViewController(detailMoviePeopleVC, animated: true)
                  
       }
}
