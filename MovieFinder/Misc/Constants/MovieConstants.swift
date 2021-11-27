//
//  MovieConstants.swift
//  MovieFinder
//
//  Created by Gareth Lloyd on 22/11/2021.
//

import Foundation

struct MovieConstants {
    private static let baseMovieListURL = "https://api.themoviedb.org/3/movie/{ID}?api_key={APIKEY}&language=en-UK&page={PAGE}&include_adult=false"
    
    static func movieListURLString(with id: String, pageNumber: Int) -> String {
        return self.baseMovieListURL
            .replacingOccurrences(of: "{APIKEY}", with: APIKeys.tmdbAPIKey)
            .replacingOccurrences(of: "{ID}", with: id)
            .replacingOccurrences(of: "{PAGE}", with: String(pageNumber))
            .replacingOccurrences(of: " ", with: "%20")
    }
    
    private static let baseSearchURL = "https://api.themoviedb.org/3/search/movie?api_key={APIKEY}&language=en-US&query={SEARCHTERM}&page={PAGE}&include_adult=false"
    static func searchURLString(with searchTerm: String, pageNumber: Int) -> String {
        return self.baseSearchURL
            .replacingOccurrences(of: "{APIKEY}", with: APIKeys.tmdbAPIKey)
            .replacingOccurrences(of: "{SEARCHTERM}", with: searchTerm)
            .replacingOccurrences(of: "{PAGE}", with: String(pageNumber))
            .replacingOccurrences(of: " ", with: "%20")
    }
    
    private static let basePosterImageURL = "https://image.tmdb.org/t/p/w300/{PATH}"
    static func posterImageURLString(with posterPath: String) -> String {
        return self.basePosterImageURL
            .replacingOccurrences(of: "{PATH}", with: posterPath)
            .replacingOccurrences(of: " ", with: "%20")
    }
}
