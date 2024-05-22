//
//  ContentViewModel.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 22.05.2024.
//

import Foundation

extension ContentView {
    final class ViewModel: ObservableObject {
        
        @Published var movies: [MovieResponse] = []
        
        func getMovies() async {
            let result = await API.Movie.getMovie.fetch(requestModel: [MovieResponse].self)
            let upComingResponse = await API.Movie.upComing.fetch(requestModel: [MovieResponse].self)
            
            switch result {
            case let .success(response):
                movies = response
            case let .failure(error):
                print(error.localizedDescription)
            }
            
            switch upComingResponse {
            case let .success(response):
                break
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
}
