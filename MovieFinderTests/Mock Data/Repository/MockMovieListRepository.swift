//
//  MockMovieListRepository.swift
//  MovieFinderTests
//
//  Created by Gareth Lloyd on 25/11/2021.
//

import UIKit
@testable import MovieFinder
@testable import Alamofire

class MockMovieListRepository: MovieRepositoryProtocol {
    
    func getMovieList(with id: String, pageNumber: Int, completion: @escaping (Result<MovieResults, AFError>) -> Void) {
        let fileName = "\(id)_\(pageNumber)"
        self.loadFileName(fileName: fileName, completion: completion)
    }
    
    func getSearchResults(with searchTerm: String, pageNumber: Int, completion: @escaping (Result<MovieResults, AFError>) -> Void) {
        let fileName = "\(searchTerm)_\(pageNumber)"
        self.loadFileName(fileName: fileName, completion: completion)
    }
    
    private func loadFileName(fileName: String, completion: @escaping (Result<MovieResults, AFError>) -> Void) {
        guard let result = self.decodeFromFile(with: fileName, type: MovieResults.self) else {
            completion(.failure(AFError.responseValidationFailed(reason: .dataFileNil)))
            return
        }
        
        completion(.success(result))
    }
    
    func decodeFromFile<T: Decodable>(with fileName: String, type: T.Type) -> T? {
        guard let path = Bundle(for: MockMovieListRepository.self).path(forResource: fileName, ofType: "json"),
              let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
                  return nil
              }
        return try! JSONDecoder().decode(T.self, from: data)
    }
}
