//
//  NetworkManager.swift
//  MovieFinder
//
//  Created by Gareth Lloyd on 27/11/2021.
//

import Alamofire
import Mocker

struct NetworkManager {
    static let shared = NetworkManager()
    private let mockSession: Session
    var session: Session {
        guard ProcessInfo.processInfo.arguments.contains("UI-Testing") else {
            return AF
        }
        
        return self.mockSession
    }
    
    
    init() {
        let configuration = URLSessionConfiguration.af.default
        configuration.protocolClasses = [MockingURLProtocol.self]
        self.mockSession = Alamofire.Session(configuration: configuration)
    }
}
