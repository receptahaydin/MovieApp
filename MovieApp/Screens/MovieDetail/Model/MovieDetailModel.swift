//
//  MovieDetailModel.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 5.06.2024.
//

import Foundation

struct Casts: Decodable {
    let cast: [Cast]?
}

// MARK: - Cast
struct Cast: Decodable, Hashable {
    let name: String?
    let profilePath: String?
    let character: String?

    enum CodingKeys: String, CodingKey {
        case name, character
        case profilePath = "profile_path"
    }
}
