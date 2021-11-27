//
//  MovieListMockData.swift
//  MovieFinder
//
//  Created by Gareth Lloyd on 26/11/2021.
//

import Mocker

enum ListPageNumber: Int {
    case one = 1
    case two = 2
}

struct MovieListMockData: MockData {
    var pageNumber: ListPageNumber
    var movieListID: String
    var dataType = Mock.DataType.json
    var statusCode = 200
    
    func orignalURL() -> URL {
        let urlString = MovieConstants.movieListURLString(with: self.movieListID, pageNumber: self.pageNumber.rawValue)
        return URL(string: urlString)!
    }
    
    func data() -> [Mock.HTTPMethod : Data] {
        let fileName = "\(self.movieListID)_\(self.pageNumber.rawValue)"
        let data = MockDataManager.shared.dataFromFile(with: fileName)!
        return [.get: data]
    }
    
    init(movieListID: String = "popular", pageNumber: ListPageNumber = .one) {
        self.movieListID = movieListID
        self.pageNumber = pageNumber
    }
}
