//
//  OptionsViewController.swift
//  MovieFinder
//
//  Created by Gareth Lloyd on 22/11/2021.
//

import UIKit

class OptionsViewController: UIViewController {

    @IBAction func goToSearch() {
        let viewModel = MovieListViewModel(title: "Search")
        let viewController = MovieListViewController(viewModel: viewModel)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func goToMostPopular() {
        let viewModel = MovieListViewModel(movieListID: "popular", title: "Popular Movies")
        let viewController = MovieListViewController(viewModel: viewModel)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
