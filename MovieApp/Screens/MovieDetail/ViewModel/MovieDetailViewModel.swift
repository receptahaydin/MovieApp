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
    
    func getCasts(movieID: Int) async {
        let result = await API.Movie.credits(movieID: movieID).fetch(responseModel: Casts.self)
        
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
    
    func getImages(movieID: Int) async {
        let result = await API.Movie.images(movieID: movieID).fetch(responseModel: Backdrops.self)
        
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
}
