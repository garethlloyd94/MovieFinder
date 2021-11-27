//
//  MovieFinderUITests.swift
//  MovieFinderUITests
//
//  Created by Gareth Lloyd on 22/11/2021.
//

import XCTest

class MovieFinderUITests: BaseUITest {

    func testPopularMovieList() {
        self.setupSteps.givenIWantToTestMovieLists()
        self.actionSteps.andITapOnPopularMoviesButton()
        self.assertionSteps.thenIShouldSeeTheFirstPopularMovieList()
        self.verifyView()
        self.actionSteps.andIScrollDownToTheNextPage()
        self.assertionSteps.thenIShouldSeeTheSecondPopularMovieList()
        self.verifyView()
    }
}
