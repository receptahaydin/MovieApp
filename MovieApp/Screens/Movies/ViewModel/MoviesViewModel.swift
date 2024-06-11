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
}
