//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 5.06.2024.
//

import Foundation

final class MovieDetailViewModel: ObservableObject {
    
    @Published var cast: [Cast] = []
    @Published var images: [Backdrop] = []
    @Published var details: MovieDetails?
    
    func getCasts(movie: TopRatedMovie) async {
        let result = await API.Movie.credits(movieID: movie.id).fetch(responseModel: Casts.self)
        
        DispatchQueue.main.async {
            switch result {
            case let .success(response):
                if let cast = response.cast {
                    self.cast = cast
                }
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getImages(movie: TopRatedMovie) async {
        let result = await API.Movie.images(movieID: movie.id).fetch(responseModel: Backdrops.self)
        
        DispatchQueue.main.async {
            switch result {
            case let .success(response):
                if let images = response.backdrops {
                    self.images = images
                }
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
                self.details = response
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
}
