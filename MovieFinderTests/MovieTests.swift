//
//  MovieTests.swift
//  MovieFinderTests
//
//  Created by Gareth Lloyd on 25/11/2021.
//

import XCTest
@testable import MovieFinder

class MovieTests: XCTestCase {
    
    var movie = Movie.init(id: 671,
                           title: "Harry Potter",
                           posterPath: "/lvOLivVeX3DVVcwfVkxKf0R22D8.jpg",
                           releaseDate: "2001-11-16",
                           voteAverage: 7.9,
                           voteCount: 24933)

    func testYearOfMovie() {
        XCTAssertTrue(self.movie.yearOfMovie() == "2001")
        self.movie.releaseDate = nil
        XCTAssertNil(self.movie.yearOfMovie())
        self.movie.releaseDate = "16-11-2001"
        XCTAssertNil(self.movie.yearOfMovie())
    }
}
