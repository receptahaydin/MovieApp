//
//  FilmCardView.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 24.05.2024.
//

import SwiftUI

struct MovieCardView: View {
    
    let movie: MovieResponse
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Image("testPoster")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 164, height: 250)
                    
                    HStack(spacing: 2) {
                        StarsRatingView(rating: movie.voteAverage / 2)
                    }
                    .padding(.top, 5)
         
                    Text(movie.title)
                        .font(.callout)
                        .fontWeight(.medium)
                        .lineLimit(1)
                        .frame(width: 164, alignment: .leading)

                    Text("Crime • 2hr 10m")
                        .font(.system(size: 12))
                        .fontWeight(.medium)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
}

#Preview {
    MovieCardView(movie: MovieResponse(id: 1, genreIDS: [0], popularity: 1.0, posterPath: "", title: "Jack Reacher", voteAverage: 9))
}
