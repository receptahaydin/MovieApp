//
//  ContentViewModel.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 22.05.2024.
//

import Foundation

final class MoviesViewModel: ObservableObject {
    
    @Published var movies: [MovieResponse] = []
    
    func getMovies() async {
        let result = await API.Movie.getMovie.fetch(requestModel: [MovieResponse].self)
        
        switch result {
        case let .success(response):
            DispatchQueue.main.async {
                self.movies = response
            }
        case let .failure(error):
            print(error.localizedDescription)
        }
    }
}
