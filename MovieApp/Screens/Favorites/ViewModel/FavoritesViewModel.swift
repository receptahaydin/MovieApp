//
//  FavoritesViewModel.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 13.06.2024.
//

import Foundation

final class FavoritesViewModel: ObservableObject {
    @Published var movieDetails: [Int: MovieDetails] = [:]
    @Published var releaseDates: [Int: ReleaseDateResult] = [:]

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
