//
//  ActionSteps.swift
//  MovieFinderUITests
//
//  Created by Gareth Lloyd on 26/11/2021.
//

import XCTest

class ActionSteps: BaseSteps {
    
    func andITapOnSearch() {
        self.tap(self.app.buttons["search_button"])
    }
    
    func andITapOnPopularMoviesButton() {
        self.tap(self.app.buttons["popular_button"])
    }
    
    func andIScrollDownToTheNextPage() {
        self.scrollToElement(element: self.app.staticTexts["Last Night in Soho"])
    }
    
    func andIEnterMySearchTerm() {
        self.app.textFields.firstMatch.typeText("HarryPotter")
        self.tap(self.app.buttons["Search"].firstMatch)
    }
}
