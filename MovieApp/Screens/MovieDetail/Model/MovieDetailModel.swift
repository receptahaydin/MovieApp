//
//  MovieDetailModel.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 5.06.2024.
//

import Foundation

// MARK: - Casts
struct Casts: Decodable {
    let cast: [Cast]?
}

struct Cast: Decodable, Hashable {
    let name: String?
    let profilePath: String?
    let character: String?

    enum CodingKeys: String, CodingKey {
        case name, character
        case profilePath = "profile_path"
    }
}

// MARK: - Backdrops
struct Backdrops: Decodable {
    let backdrops: [Backdrop]?
}

struct Backdrop: Decodable, Hashable {
    let filePath: String?

    enum CodingKeys: String, CodingKey {
        case filePath = "file_path"
    }
}

// MARK: - Details
struct MovieDetails: Decodable {
    let genres: [Genre]?
    let runtime: Int?
}
