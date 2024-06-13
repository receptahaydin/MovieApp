//
//  ContentViewModel.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 22.05.2024.
//

import Foundation

enum MovieType {
    case nowPlaying
    case upComing
}

final class MoviesViewModel: ObservableObject {
    
    @Published var movies: [MovieResponse] = []
    @Published var movieDetails: [Int: MovieDetails] = [:]
    @Published var releaseDates: [Int: ReleaseDateResult] = [:]
    
    var nowPlayingMovies: [MovieResponse] = []
    var upComingMovies: [MovieResponse] = []
    
    func getMovies(type: MovieType) async {
        var apiEndpoint: API.Movie
        
        switch type {
        case .nowPlaying:
            apiEndpoint = .nowPlaying
        case .upComing:
            apiEndpoint = .upComing
        }
        
        let result = await apiEndpoint.fetch(responseModel: AllMovieResponse.self)
        
        DispatchQueue.main.async {
            switch result {
            case let .success(response):
                self.movies = response.results
                switch type {
                case .nowPlaying:
                    self.nowPlayingMovies = response.results
                case .upComing:
                    self.upComingMovies = response.results
                }
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getDetails(movieID: Int) async {
        let result = await API.Movie.movieDetails(movieID: movieID).fetch(responseModel: MovieDetails.self)
        
        DispatchQueue.main.async {
            switch result {
            case let .success(response):
                self.movieDetails[movieID] = response
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getReleaseDates(movieID: Int) async {
        let result = await API.Movie.releaseDates(movieID: movieID).fetch(responseModel: ReleaseDateResult.self)
        
        DispatchQueue.main.async {
            switch result {
            case let .success(response):
                self.releaseDates[movieID] = response
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
}
