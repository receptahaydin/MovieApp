//
//  MoviesModel.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 3.06.2024.
//

import Foundation

// MARK: - Top Rated Movies
struct TopRatedMovies: Decodable {
    let results: [TopRatedMovie]
}

struct TopRatedMovie: Decodable {
    let id: Int
    let posterPath: String
    let title: String
    let voteAverage: Double
    let overview: String
    
    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
    }
}

// MARK: - Details
struct MovieDetails: Decodable {
    let genres: [Genre]?
    let runtime: Int?
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
