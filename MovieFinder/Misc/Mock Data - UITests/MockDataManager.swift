//
//  MockDataManager.swift
//  MovieFinder
//
//  Created by Gareth Lloyd on 25/11/2021.
//

import UIKit
import Mocker
import Alamofire

class MockDataManager {
    
    static let shared = MockDataManager()
    
    var mockDataArray = [MockData]()
    
    func createMovieListMockData() {
        let mockDataPopular = MovieListMockData(movieListID: "popular", pageNumber: .one)
        self.mockDataArray.append(mockDataPopular)
        let mockDataPopularPage2 = MovieListMockData(movieListID: "popular", pageNumber: .two)
        self.mockDataArray.append(mockDataPopularPage2)
    }
    
    func createSearchMovieData() {
        let mockDataSearch = SearchMockData()
        self.mockDataArray.append(mockDataSearch)
        let mockDataSearchPage2 = SearchMockData(pageNumber: .two)
        self.mockDataArray.append(mockDataSearchPage2)
    }
    
    func dataFromFile(with fileName: String) -> Data? {
        guard let path = Bundle(for: MockDataManager.self).path(forResource: fileName, ofType: "json") else {
            return nil
        }
        
        return try? Data(contentsOf: URL(fileURLWithPath: path))
    }
    
    func mock() {
        mockDataArray.forEach({ Mock(url: $0.orignalURL(), dataType: $0.dataType, statusCode: $0.statusCode, data: $0.data()).register() })
    }
}
