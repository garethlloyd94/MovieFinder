//
//  ConstantsTests.swift
//  MovieFinderTests
//
//  Created by Gareth Lloyd on 25/11/2021.
//

import XCTest
@testable import MovieFinder

class ConstantsTests: XCTestCase {
    
    func testMovieListURL() {
        let movieListURL = "https://api.themoviedb.org/3/movie/popular?api_key={APIKEY}&language=en-UK&page=1&include_adult=false"
            .replacingOccurrences(of: "{APIKEY}", with: APIKeys.tmdbAPIKey)
        XCTAssertTrue(MovieConstants.movieListURLString(with: "popular", pageNumber: 1) == movieListURL)
    }

    func testSearchURL() {
        let searchURL = "https://api.themoviedb.org/3/search/movie?api_key={APIKEY}&language=en-US&query=Harry%20Potter&page=1&include_adult=false"
            .replacingOccurrences(of: "{APIKEY}", with: APIKeys.tmdbAPIKey)
        XCTAssertTrue(MovieConstants.searchURLString(with: "Harry Potter", pageNumber: 1) == searchURL)
    }
    
    func testPosterPathURL() {
        let posterPathURL = "https://image.tmdb.org/t/p/w300//9Lz64Rh09zEhJmpgAh37bMiuDyW.jpg"
        XCTAssertTrue(MovieConstants.posterImageURLString(with: "/9Lz64Rh09zEhJmpgAh37bMiuDyW.jpg") == posterPathURL)
    }
}
