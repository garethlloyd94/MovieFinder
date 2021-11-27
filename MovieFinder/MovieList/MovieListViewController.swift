//
//  MovieListViewController.swift
//  MovieFinder
//
//  Created by Gareth Lloyd on 22/11/2021.
//

import UIKit

class MovieListViewController: BaseMVVMViewController<MovieListViewModel> {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.getMoviesFromID()
        self.setup()
    }
    
    private func setup() {
        self.title = self.viewModel.title
        self.searchView.isHidden = self.viewModel.searchViewHidden
        if !self.viewModel.searchViewHidden {
            self.searchTextField.becomeFirstResponder()
        }
        self.setupTableView()
    }
    
    private func setupTableView() {
        self.tableView.register(cell: MovieListTableViewCell.self)
        self.tableView.tableFooterView = UIView()
    }

    override func updateView(_ type: MovieListViewModel.UpdateType) {
        switch type {
        case .moviesUpdated:
            self.tableView.reloadData()
        }
    }
    
    override func handle(_ error: MovieListViewModel.ErrorType) {
        switch error {
        case .error(let error):
            //TODO: SHOW UI FOR ERROR
            print(error.localizedDescription)
        }
    }
    
    @IBAction func searchAction() {
        self.viewModel.getSearchResults(with: self.searchTextField.text)
        self.searchTextField.resignFirstResponder()
    }
}

extension MovieListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfMovies
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeue(cell: MovieListTableViewCell.self, indexPath: indexPath)
        cell.configure(with: self.viewModel.movie(for: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.viewModel.getNextMoviesPage(with: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

extension MovieListViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.viewModel.getSearchResults(with: self.searchTextField.text)
        self.searchTextField.resignFirstResponder()
        return true
    }
}
