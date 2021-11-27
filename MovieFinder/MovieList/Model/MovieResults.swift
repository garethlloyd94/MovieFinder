//
//  MovieResults.swift
//  MovieFinder
//
//  Created by Gareth Lloyd on 22/11/2021.
//

import Foundation

struct MovieResults: Codable {
    let results: [Movie]
    let page: Int
    let totalPages: Int
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case results, page
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}


struct Movie: Codable {
    let id: Int
    let title: String
    let posterPath: String?
    var releaseDate: String?
    let voteAverage: Double?
    let voteCount: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case releaseDate = "release_date"
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    func yearOfMovie() -> String? {
        guard let releaseDate = releaseDate else {
            return nil
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-mm-DD"
        if let dateOfMovie = dateFormatter.date(from: releaseDate) {
            dateFormatter.dateFormat = "YYYY"
            return dateFormatter.string(from: dateOfMovie)
        }
        return nil
    }
}
