//
//  MovieDetailView.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 26.05.2024.
//

import SwiftUI
import Kingfisher

struct MovieDetailView: View {
    
    var movie: TopRatedMovie
    @StateObject var viewModel = MovieDetailViewModel()
    @State var lineLimit = true
    @State var isFavorite = false
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    if let url = URL(string: "http://image.tmdb.org/t/p/w500\(movie.posterPath)") {
                        KFImage(url)
                            .placeholder {
                                ProgressView()
                            }
                            .resizable()
                            .scaledToFill()
                            .frame(height: geo.size.height / 3, alignment: .top)
                            .clipped()
                            .blur(radius: 2.5, opaque: true)
                    }
                    
                    if let url = URL(string: "http://image.tmdb.org/t/p/w500\(movie.posterPath)") {
                        KFImage(url)
                            .placeholder {
                                ProgressView()
                            }
                            .resizable()
                            .scaledToFit()
                            .frame(height: geo.size.height / 3)
                            .padding(.top, -geo.size.height / 5.5)
                    }
                    
                    VStack(spacing: 10) {
                        Text(movie.title)
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Text(convertToHoursMinutes(minutes: viewModel.details?.runtime ?? 0))
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        
                        Text(genreNames(genre: viewModel.details?.genres ?? []))
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                    .multilineTextAlignment(.center)
                    .padding()
                    
                    HStack {
                        let roundedVoteAverage = String(format: "%.1f", movie.voteAverage / 2)
                        Text("\(roundedVoteAverage)/5")
                            .font(.title)
                        
                        StarsRatingView(rating: Double(roundedVoteAverage) ?? 0, widthHeight: 20)
                    }
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Synopsis")
                            .font(.headline)
                        
                        Text(movie.overview)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .lineLimit(lineLimit ? 4 : nil)
                    }
                    .padding()
                    
                    Button {
                        withAnimation {
                            lineLimit.toggle()
                        }
                    } label: {
                        DetailViewButton(title: lineLimit ? "Show More" : "Show Less")
                    }
                    
                    VStack(alignment: .leading, spacing: 15) {
                        HStack {
                            Text("Cast & Crew")
                                .font(.headline)
                            
                            Spacer()
                            
                            NavigationLink(destination: CastCrewView(casts: viewModel.cast)) {
                                DetailViewButton(title: "View All")
                            }
                        }
                        
                        ForEach(viewModel.cast.prefix(5), id: \.self) { cast in
                            CastCrewCell(cast: cast)
                        }
                    }
                    .padding()
                    
                    VStack {
                        HStack {
                            Text("Photos")
                                .font(.headline)
                            
                            Spacer()
                            
                            NavigationLink(destination: PhotosView(images: viewModel.images)) {
                                DetailViewButton(title: "View All")
                            }
                        }
                        .padding([.horizontal, .top])
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 8) {
                                ForEach(viewModel.images.prefix(5), id: \.self) { image in
                                    if let imagePath = image.filePath, let url = URL(string: "http://image.tmdb.org/t/p/w500\(imagePath)") {
                                        AsyncImage(url: url) { image in
                                            image
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 104, height: 72)
                                        } placeholder: {
                                            Image(systemName: "photo")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 104, height: 72)
                                        }
                                    } else {
                                        Image(systemName: "photo")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 104, height: 72)
                                    }
                                }
                            }
                        }
                        .padding(.leading)
                    }
                }
            }
            .ignoresSafeArea(edges: .top)
        }
        .onAppear {
            Task {
                async let castsResult: () = viewModel.getCasts(movie: movie)
                async let imagesResult: () = viewModel.getImages(movie: movie)
                async let details: () = viewModel.getDetails(movie: movie)
                
                await castsResult
                await imagesResult
                await details
            }
        }
        .toolbar {
            FavoriteAnimationView(isLiked: $isFavorite)
        }
        .toolbarRole(.editor)
    }
    
    private func convertToHoursMinutes(minutes: Int) -> String {
        let hours = minutes / 60
        let minutes = (minutes % 60)
        
        return "\(hours)hr \(minutes)m"
    }
    
    private func genreNames(genre: [Genre]) -> String {
        let genreNames = genre.compactMap { $0.name }
        let result = genreNames.joined(separator: ", ")
        return result
    }
}

#Preview {
    MovieDetailView(movie: TopRatedMovie(id: 1, genreIDS: [], popularity: 1, posterPath: "", title: "", voteAverage: 1, overview: ""))
}
