//
//  GetMoviesResponse.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 22.05.2024.
//

import Foundation

struct TopRatedResponse: Decodable {
    
    let id: Int?
    let genreIDS: [Int]?
    let popularity: Double?
    let posterPath: String?
    let title: String?
    let voteAverage: Double?
    
    enum CodingKeys: String, CodingKey {
        case id
        case genreIDS = "genre_ids"
        case popularity
        case posterPath = "poster_path"
        case title
        case voteAverage = "vote_average"
    }
}
