//
//  MovieListsTests.swift
//  MovieFinderTests
//
//  Created by Gareth Lloyd on 25/11/2021.
//

import XCTest
@testable import MovieFinder

class MovieListsTests: XCTestCase {
    
    let viewModel = MovieListViewModel(movieListID: "popular",
                                       title: "Popular Movies",
                                       repository: MockMovieListRepository())
    let missingIDViewModel = MovieListViewModel(title: "Popular Movies",
                                                repository: MockMovieListRepository())
    
    override func setUp() {
        self.viewModel.getMoviesFromID()
        self.missingIDViewModel.getMoviesFromID()
    }
    
    // Movie ID Testing
    func testInitialDownload() {
        XCTAssertTrue(self.viewModel.numberOfMovies == 20)
    }
    
    func testNextPageDownload() {
        self.viewModel.getNextMoviesPage(with: 5)
        XCTAssertTrue(self.viewModel.numberOfMovies == 20)
        self.viewModel.getNextMoviesPage(with: 15)
        XCTAssertTrue(self.viewModel.numberOfMovies == 40)
        self.viewModel.getNextMoviesPage(with: 30)
        XCTAssertTrue(self.viewModel.numberOfMovies == 40)
    }
    
    func testMovieForIndex() {
        let movie = self.viewModel.movie(for: 0)
        XCTAssertTrue(movie.title == "Venom: Let There Be Carnage")
        XCTAssertTrue(movie.yearOfMovie() == "2021")
        let movie10 = self.viewModel.movie(for: 10)
        XCTAssertTrue(movie10.title == "7 Prisoners")
        XCTAssertTrue(movie10.yearOfMovie() == "2021")
    }
    
    func testTitle() {
        XCTAssertTrue(self.viewModel.title == "Popular Movies")
    }
    
    func testSearchViewHidden() {
        XCTAssertTrue(self.viewModel.searchViewHidden)
    }
    
    func testMissingMovieID() {
        XCTAssertTrue(self.missingIDViewModel.numberOfMovies == 0)
    }
}
