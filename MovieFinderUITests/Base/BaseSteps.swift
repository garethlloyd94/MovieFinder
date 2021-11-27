//
//  BaseSteps.swift
//  MovieFinderUITests
//
//  Created by Gareth Lloyd on 26/11/2021.
//

import XCTest
import FBSnapshotTestCase

class BaseSteps: FBSnapshotTestCase {
    var app = XCUIApplication()
    
    func cleanAndLaunch() {
        self.continueAfterFailure = true
        self.app.launchArguments = ["UI-Testing"]
        self.app.launch()
    }
    
    func tap(_ element: XCUIElement, waitTime: Int = 30) {
        waitUntilOnScreenBeforeContinuing(element: element, waitTime: waitTime)
        element.tap()
    }
    
    func waitUntilOnScreenBeforeContinuing(element: XCUIElement, waitTime: Int = 30) {
        let exists = NSPredicate(format: "exists == 1")
        expectation(for: exists, evaluatedWith: element, handler: nil)
        waitForExpectations(timeout: TimeInterval(waitTime), handler: nil)
    }
    
    func exists(_ elements: XCUIElement..., waitTime: Int = 30) -> Bool {
        for element in elements {
            if !element.waitForExistence(timeout: TimeInterval(waitTime)) {
                return false
            }
        }
        return true
    }
    
    func scrollToElement(element: XCUIElement) {
        while !exists(element) {
            self.app.swipeUp()
        }
    }
}
