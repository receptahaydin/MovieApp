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
    let genreIDS: [Int]
    let popularity: Double
    let posterPath: String
    let title: String
    let voteAverage: Double
    let overview: String
    
    enum CodingKeys: String, CodingKey {
        case id, popularity, title, overview
        case genreIDS = "genre_ids"
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
    }
}

// MARK: - Genres
struct Genres: Decodable {
    let genres: [Genre]?
}

// MARK: - Genre
struct Genre: Decodable {
    let id: Int?
    let name: String?
}
