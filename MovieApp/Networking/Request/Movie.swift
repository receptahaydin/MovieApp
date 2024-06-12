//
//  Movie.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 22.05.2024.
//

import Foundation

public extension API {
    enum Movie: Networkable {
        case topRated
        case upComing
        case genres
        case credits(movieID: Int)
        case images(movieID: Int)
        case movieDetails(movieID: Int)
        case releaseDates(movieID: Int)
        
        public func request() async -> URLRequest {
            switch self {
            case .topRated:
                await getRequest(path: "3/movie/top_rated")
            case .upComing:
                await getRequest(path: "3/movie/upcoming")
            case .genres:
                await getRequest(path: "3/genre/movie/list")
            case .credits(let movieID):
                await getRequest(path: "3/movie/\(movieID)/credits")
            case .images(let movieID):
                await getRequest(path: "3/movie/\(movieID)/images")
            case .movieDetails(let movieID):
                await getRequest(path: "3/movie/\(movieID)")
            case .releaseDates(let movieID):
                await getRequest(path: "3/movie/\(movieID)/release_dates")
            }
        }
    }
}
