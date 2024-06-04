//
//  MovieDetailView.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 26.05.2024.
//

import SwiftUI
import Kingfisher

struct MovieDetailView: View {
    
    let movie: MovieResponse
    
    var body: some View {
        if let url = URL(string: "http://image.tmdb.org/t/p/w500\(movie.posterPath)") {
            KFImage(url)
                .placeholder {
                    ProgressView()
                }
                .resizable()
                .scaledToFit()
                .frame(height: 250)
        }
    }
}

#Preview {
    MovieDetailView(movie: MovieResponse(id: 1, genreIDS: [0], popularity: 1.0, posterPath: "", title: "Jack Reacher", voteAverage: 9))
}
