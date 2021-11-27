//
//  SearchUITests.swift
//  MovieFinderUITests
//
//  Created by Gareth Lloyd on 27/11/2021.
//

import UIKit

class SearchUITests: BaseUITest {
   
    func testPopularMovieList() {
        self.setupSteps.givenIWantToTestSearch()
        self.actionSteps.andITapOnSearch()
        self.actionSteps.andIEnterMySearchTerm()
        self.assertionSteps.thenIShouldSeeTheFirstSearchMovieList()
        self.verifyView()
    }
}
