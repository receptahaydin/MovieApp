//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 5.06.2024.
//

import Foundation

final class MovieDetailViewModel: ObservableObject {
    
    @Published var cast: [Cast] = []
    
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
}
