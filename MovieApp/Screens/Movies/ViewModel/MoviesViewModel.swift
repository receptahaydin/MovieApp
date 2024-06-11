//
//  ContentViewModel.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 22.05.2024.
//

import Foundation

final class MoviesViewModel: ObservableObject {
    
    @Published var movies: [TopRatedMovie] = []
    @Published var genres: [Genre] = []
    
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
    
    func getGenres() async {
        let result = await API.Movie.genres.fetch(responseModel: Genres.self)
        
        DispatchQueue.main.async {
            switch result {
            case let .success(response):
                self.genres = response.genres ?? []
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
}
