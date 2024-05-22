//
//  GetMoviesResponse.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 22.05.2024.
//

import Foundation

public struct MovieResponse: Decodable {
    public let title: String?
    
    public init(title: String?) {
        self.title = title
    }
}
