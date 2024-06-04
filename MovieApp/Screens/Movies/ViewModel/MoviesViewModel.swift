//
//  ContentViewModel.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 22.05.2024.
//

import Foundation

@MainActor
final class MoviesViewModel: ObservableObject {
    
    @Published var movies: [TopRatedMovie] = []
    
    func getMovies() async {
        let result = await API.Movie.topRated.fetch(responseModel: [TopRatedMovie].self)
        
        switch result {
        case let .success(response):
            self.movies = response
        case let .failure(error):
            print(error.localizedDescription)
        }
    }
}
