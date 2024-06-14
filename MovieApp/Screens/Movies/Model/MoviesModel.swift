//
//  MoviesModel.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 3.06.2024.
//

import Foundation

// MARK: - All Movies
struct AllMovieResponse: Decodable {
    let results: [MovieResponse]
}

struct MovieResponse: Decodable {
    let id: Int
    let title: String
}

// MARK: - Details
struct MovieDetails: Decodable {
    let id: Int?
    let genres: [Genre]?
    let overview: String?
    let posterPath: String?
    let runtime: Int?
    let title: String?
    let voteAverage: Double?

    enum CodingKeys: String, CodingKey {
        case id, overview, runtime, title, genres
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
    }
}

struct Genre: Decodable {
    let name: String?
}

// MARK: - Release Date Result
struct ReleaseDateResult: Decodable {
    let results: [DateResult]?
}

struct DateResult: Decodable {
    let iso3166_1: String?
    let releaseDates: [ReleaseDateElement]?

    enum CodingKeys: String, CodingKey {
        case iso3166_1 = "iso_3166_1"
        case releaseDates = "release_dates"
    }
}

struct ReleaseDateElement: Decodable {
    let certification: String?
}
