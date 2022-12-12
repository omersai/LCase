//
//  Movie.swift
//  MoviesApi
//
//  Created by OMER on 7.12.2022.
//

import Foundation

// MARK: - Movie
public struct MovieResponse: Codable, Equatable {
    public let results: [Movie]
}

// MARK: - Result
public struct Movie: Codable, Equatable {
    public let adult: Bool
    public let genreIDS: [Int]
    public let id: Int
    public let originalLanguage, originalTitle, overview: String
    public let popularity: Double
    public let posterPath: String?
    public let releaseDate, title: String
    public let video: Bool
    public let voteAverage: Double
    public let voteCount: Int
    public var movieImage: String{
        if posterPath == nil{
            return "https://www.themoviedb.org/assets/2/apple-touch-icon-cfba7699efe7a742de25c28e08c38525f19381d31087c69e89d6bcb8e3c0ddfa.png"
        }
        else{
            return "https://image.tmdb.org/t/p/w500/\(posterPath ?? "")"
        }
    }

    enum CodingKeys: String, CodingKey {
        case adult
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
