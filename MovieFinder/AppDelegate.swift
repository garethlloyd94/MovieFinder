//
//  AppDelegate.swift
//  MovieFinder
//
//  Created by Gareth Lloyd on 22/11/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navigationController = UINavigationController(rootViewController: OptionsViewController())
        self.window = UIWindow()
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        self.checkIfUITesting()
        return true
    }
    
    private func checkIfUITesting() {
        let isUITesting = ProcessInfo.processInfo.arguments.contains("UI-Testing")
        if isUITesting {
            MockDataManager.shared.createMovieListMockData()
            MockDataManager.shared.createSearchMovieData()
            MockDataManager.shared.mock()
        }
    }
}

