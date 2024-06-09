//
//  ContentViewModel.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 22.05.2024.
//

import Foundation

final class MoviesViewModel: ObservableObject {
    
    @Published var movies: [TopRatedMovie] = []
    
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
}
