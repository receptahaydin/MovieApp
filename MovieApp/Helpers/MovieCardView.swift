//
//  MovieCardView.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 24.05.2024.
//

import SwiftUI
import Kingfisher
import SwiftData

struct MovieCardView: View {
    
    @Query var movies: [Movie]
    let details: MovieDetails?
    let certification: String?
    
    var body: some View {
        NavigationLink(destination: MovieDetailView(movieID: details?.id ?? 0, certification: certification, details: details, movies: movies)) {
            VStack(alignment: .leading, spacing: 5) {
                if let url = URL(string: "http://image.tmdb.org/t/p/w500\(details?.posterPath ?? "")") {
                    KFImage(url)
                        .placeholder {
                            ProgressView()
                        }
                        .resizable()
                        .scaledToFit()
                        .frame(height: 250)
                }
                
                HStack(spacing: 2) {
                    StarsRatingView(rating: (details?.voteAverage ?? 0) / 2)
                }
                .padding(.top, 5)
                
                Text(details?.title ?? "")
                    .font(.callout)
                    .fontWeight(.medium)
                    .lineLimit(1)
                    .foregroundStyle(Color.label)
                
                HStack(alignment: .bottom, spacing: 4) {
                    Text("\(details?.genres?.first?.name ?? "")")
                    
                    if let runtime = details?.runtime?.toHoursMinutes(), !runtime.isEmpty {
                        Text("• \(runtime)")
                    }
                    
                    if let certification = certification, !certification.isEmpty {
                        Text("|")
                            .font(.system(size: 13))
                        
                        Text(certification)
                    }
                }
                .lineLimit(1)
                .font(.system(size: 12))
                .fontWeight(.medium)
                .foregroundStyle(.gray)
            }
            .frame(width: 164)
            .padding()
        }
    }
}

#Preview {
    MovieCardView(details: MovieDetails(id: 0, genres: [], overview: "", posterPath: "", runtime: 0, title: "", voteAverage: 0), certification: "")
}
