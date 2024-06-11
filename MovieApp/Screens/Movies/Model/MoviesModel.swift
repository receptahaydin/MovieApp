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

// MARK: - Genres
struct Genres: Decodable {
    let genres: [Genre]?
}

// MARK: - Genre
struct Genre: Decodable {
    let name: String?
}
