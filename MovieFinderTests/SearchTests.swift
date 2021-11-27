//
//  SearchTests.swift
//  MovieFinderTests
//
//  Created by Gareth Lloyd on 25/11/2021.
//

import XCTest
@testable import MovieFinder

class SearchTests: XCTestCase {
    
    let viewModel = MovieListViewModel(title: "Search", repository: MockMovieListRepository())
    private let searchTerm = "HarryPotter"
    
    override func setUp() {
        self.viewModel.getSearchResults(with: searchTerm)
    }
    
    // Movie ID Testing
    func testInitialDownload() {
        XCTAssertTrue(self.viewModel.numberOfMovies == 20)
    }
    
    func testNextPageDownload() {
        self.viewModel.getNextMoviesPage(with: 5)
        XCTAssertTrue(self.viewModel.numberOfMovies == 20)
        self.viewModel.getNextMoviesPage(with: 15)
        XCTAssertTrue(self.viewModel.numberOfMovies == 25)
        self.viewModel.getNextMoviesPage(with: 35)
        XCTAssertTrue(self.viewModel.numberOfMovies == 25)
    }
    
    func testMovieForIndex() {
        let movie = self.viewModel.movie(for: 0)
        XCTAssertTrue(movie.title == "Harry Potter and the Philosopher\'s Stone")
        XCTAssertTrue(movie.yearOfMovie() == "2001")
        let movie10 = self.viewModel.movie(for: 10)
        XCTAssertTrue(movie10.title == "Harry Potter: A History Of Magic")
        XCTAssertTrue(movie10.yearOfMovie() == "2017")
    }
    
    func testTitle() {
        XCTAssertTrue(self.viewModel.title == "Search")
    }
    
    func testSearchViewHidden() {
        XCTAssertFalse(self.viewModel.searchViewHidden)
    }
    
    func testEmptySearchTerm() {
        self.viewModel.getSearchResults(with: "")
        XCTAssertTrue(self.viewModel.numberOfMovies == 0)
    }
    
    func testNilSearchTerm() {
        self.viewModel.getSearchResults(with: nil)
        XCTAssertTrue(self.viewModel.numberOfMovies == 0)
    }
}
