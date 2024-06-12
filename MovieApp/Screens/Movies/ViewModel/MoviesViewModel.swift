//
//  ContentViewModel.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 22.05.2024.
//

import Foundation

final class MoviesViewModel: ObservableObject {
    
    @Published var movies: [TopRatedMovie] = []
    @Published var movieDetails: [Int: MovieDetails] = [:]
    @Published var releaseDates: [Int: ReleaseDateResult] = [:]

    func getMovies() async {
        let result = await API.Movie.topRated.fetch(responseModel: TopRatedMovies.self)
        
        DispatchQueue.main.async {
            switch result {
            case let .success(response):
                self.movies = response.results
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getDetails(movie: TopRatedMovie) async {
        let result = await API.Movie.movieDetails(movieID: movie.id).fetch(responseModel: MovieDetails.self)
        
        DispatchQueue.main.async {
            switch result {
            case let .success(response):
                self.movieDetails[movie.id] = response
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getReleaseDates(movie: TopRatedMovie) async {
        let result = await API.Movie.releaseDates(movieID: movie.id).fetch(responseModel: ReleaseDateResult.self)
        
        DispatchQueue.main.async {
            switch result {
            case let .success(response):
                self.releaseDates[movie.id] = response
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
}
