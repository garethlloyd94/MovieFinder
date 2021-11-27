//
//  AssertionSteps.swift
//  MovieFinderUITests
//
//  Created by Gareth Lloyd on 26/11/2021.
//

import XCTest

class AssertionSteps: BaseSteps {
    
    func thenIShouldSeeTheFirstPopularMovieList() {
        self.waitUntilOnScreenBeforeContinuing(element: self.app.staticTexts["Venom: Let There Be Carnage"])
    }
    
    func thenIShouldSeeTheSecondPopularMovieList() {
        self.waitUntilOnScreenBeforeContinuing(element: self.app.staticTexts["Last Night in Soho"])
    }
    
    func thenIShouldSeeTheFirstSearchMovieList() {
        self.waitUntilOnScreenBeforeContinuing(element: self.app.staticTexts["Harry Potter and the Philosopher's Stone"])
    }
}
