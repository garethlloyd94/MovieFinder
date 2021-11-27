//
//  MovieRepository.swift
//  MovieFinder
//
//  Created by Gareth Lloyd on 22/11/2021.
//

import Foundation
import Alamofire

protocol MovieRepositoryProtocol {
    func getMovieList(with id: String, pageNumber: Int, completion: @escaping (Result<MovieResults, AFError>) -> Void)
    func getSearchResults(with searchTerm: String, pageNumber: Int, completion: @escaping (Result<MovieResults, AFError>) -> Void)
}

class MovieRepository: MovieRepositoryProtocol {
    func getMovieList(with id: String, pageNumber: Int, completion: @escaping (Result<MovieResults, AFError>) -> Void) {
        NetworkManager.shared.session.request(MovieConstants.movieListURLString(with: id, pageNumber: pageNumber))
            .validate()
            .responseDecodable(of: MovieResults.self) { response in
                completion(response.result)
            }
    }
    
    func getSearchResults(with searchTerm: String, pageNumber: Int, completion: @escaping (Result<MovieResults, AFError>) -> Void) {
        NetworkManager.shared.session.request(MovieConstants.searchURLString(with: searchTerm, pageNumber: pageNumber))
            .validate()
            .responseDecodable(of: MovieResults.self) { response in
                completion(response.result)
            }
    }
}
