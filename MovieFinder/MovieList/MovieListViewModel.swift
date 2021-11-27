//
//  MovieListViewModel.swift
//  MovieFinder
//
//  Created by Gareth Lloyd on 22/11/2021.
//

import Foundation
import Alamofire

private let NextPageBuffer: Int = 5

class MovieListViewModel: BaseViewModel, ViewModelProtocol {
    
    private let repository: MovieRepositoryProtocol
    private let movieListID: String?
    private var searchTerm: String?
    private var isDownloading = false
    private var lastMoviesResult: MovieResults?
    private var movies = [Movie]() {
        didSet {
            self.update?(.moviesUpdated)
        }
    }
    var title: String
    var searchViewHidden: Bool {
        return self.movieListID != nil
    }
    var numberOfMovies: Int {
        return self.movies.count
    }
    
    init(movieListID: String? = nil,
         title: String,
         repository: MovieRepositoryProtocol = MovieRepository()) {
        self.title = title
        self.movieListID = movieListID
        self.repository = repository
    }
    
    func getSearchResults(with searchTerm: String?, page: Int = 1) {
        guard let searchTerm = searchTerm, !searchTerm.isEmpty else {
            self.movies.removeAll()
            return
        }
        
        self.searchTerm = searchTerm
        if page == 1 {
            self.movies.removeAll()
            self.base?(.beginLoading)
        }
        
        self.isDownloading = true
        repository.getSearchResults(with: searchTerm, pageNumber: page) { [weak self] result in
            self?.handle(result: result)
        }
    }
    
    func getMoviesFromID(page: Int = 1) {
        guard let movieListID = self.movieListID, !movieListID.isEmpty else {
            self.movies.removeAll()
            return
        }
        
        if page == 1 {
            self.movies.removeAll()
            self.base?(.beginLoading)
        }
        self.isDownloading = true
        repository.getMovieList(with: movieListID, pageNumber: page) { [weak self] result in
            self?.handle(result: result)
        }
    }
    
    func movie(for index: Int) -> Movie {
        return self.movies[index]
    }
    
    private func handle(result: Result<MovieResults, AFError>) {
        self.base?(.endLoading)
        self.isDownloading = false
        switch result {
        case .success(let movieResults):
            self.movies.append(contentsOf: movieResults.results)
            self.lastMoviesResult = movieResults
        case .failure(let error):
            self.error?(.error(error))
        }
    }
    
    func getNextMoviesPage(with index: Int) {
        guard !self.isDownloading,
        let lastMovieResult = self.lastMoviesResult,
        lastMovieResult.totalResults > self.numberOfMovies,
        index >= (self.numberOfMovies - NextPageBuffer) else {
            return
        }
        
        let nextPage = lastMovieResult.page + 1
        movieListID != nil ? self.getMoviesFromID(page: nextPage) : self.getSearchResults(with: self.searchTerm, page: nextPage)
    }

    // MARK: - Errors
    var error: ((MovieListViewModel.ErrorType) -> Void)?
    enum ErrorType {
        case error(Error)
    }
    
    // MARK: - Updates
    var update: ((MovieListViewModel.UpdateType) -> Void)?
    enum UpdateType {
        case moviesUpdated
    }
}
