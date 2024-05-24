//
//  ContentViewModel.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 22.05.2024.
//

import Foundation

extension ContentView {
    final class ViewModel: ObservableObject {
        
        @Published var movies: [TopRatedResponse] = []
        
        func getMovies() async {
            let result = await API.Movie.getMovie.fetch(requestModel: [TopRatedResponse].self)
            
            switch result {
            case let .success(response):
                movies = response
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
}
