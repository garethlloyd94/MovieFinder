//
//  BaseUITest.swift
//  MovieFinderUITests
//
//  Created by Gareth Lloyd on 26/11/2021.
//

import XCTest
import FBSnapshotTestCase

class BaseUITest: FBSnapshotTestCase {
    var setupSteps = SetupSteps()
    var actionSteps = ActionSteps()
    var assertionSteps = AssertionSteps()
    
    override func setUp() {
        super.setUp()
        self.recordMode = false
    }
    
    func verifyView(file: StaticString = #file, line: UInt = #line) {
        guard let croppedImage = XCUIApplication().screenshot().image.removingStatusBar else {
            return XCTFail("An error occurred while cropping the screenshot", file: file, line: line)
        }
        FBSnapshotVerifyView(UIImageView(image: croppedImage))
    }
}
