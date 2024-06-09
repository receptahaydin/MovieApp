//
//  MovieCardView.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 24.05.2024.
//

import SwiftUI
import Kingfisher

struct MovieCardView: View {
    
    let movie: TopRatedMovie
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            if let url = URL(string: "http://image.tmdb.org/t/p/w500\(movie.posterPath)") {
                KFImage(url)
                    .placeholder {
                        ProgressView()
                    }
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
            }
            
            HStack(spacing: 2) {
                StarsRatingView(rating: movie.voteAverage / 2)
            }
            .padding(.top, 5)
            
            Text(movie.title)
                .font(.callout)
                .fontWeight(.medium)
                .lineLimit(1)
                .foregroundStyle(Color.label)
            
            Text("Crime • 2hr 10m")
                .font(.system(size: 12))
                .fontWeight(.medium)
                .foregroundStyle(.gray)
        }
        .frame(width: 164)
        .padding()
    }
}

#Preview {
    MovieCardView(movie: TopRatedMovie(id: 1, genreIDS: [0], popularity: 1.0, posterPath: "", title: "Jack Reacher", voteAverage: 9, overview: ""))
}
