//
//  SearchMockData.swift
//  MovieFinder
//
//  Created by Gareth Lloyd on 27/11/2021.
//

import Mocker

class SearchMockData: MockData {
    var pageNumber: ListPageNumber
    var searchTerm: String
    var dataType = Mock.DataType.json
    var statusCode = 200
    
    func orignalURL() -> URL {
        let urlString = MovieConstants.searchURLString(with: self.searchTerm, pageNumber: self.pageNumber.rawValue)
        return URL(string: urlString)!
    }
    
    func data() -> [Mock.HTTPMethod : Data] {
        let fileName = "\(self.searchTerm)_\(self.pageNumber.rawValue)"
        let data = MockDataManager.shared.dataFromFile(with: fileName)!
        return [.get: data]
    }
    
    init(searchTerm: String = "HarryPotter", pageNumber: ListPageNumber = .one) {
        self.searchTerm = searchTerm
        self.pageNumber = pageNumber
    }
}
