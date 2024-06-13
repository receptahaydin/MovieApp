//
//  ContentView.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 22.05.2024.
//

import SwiftUI
import SwiftData

struct MoviesView: View {
    @Query var movies: [Movie]
    @StateObject var viewModel = MoviesViewModel()
    @State private var selectedIndex = 0
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                segmentedPicker
                
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.movies, id: \.id) { movie in
                        NavigationLink(destination: MovieDetailView(movie: movie, 
                                                                    details: viewModel.movieDetails[movie.id],
                                                                    movies: self.movies)) {
                            MovieCardView(movie: movie,
                                          details: viewModel.movieDetails[movie.id],
                                          certification: getCertification(for: viewModel.releaseDates[movie.id] ?? ReleaseDateResult(results: [])))
                                .task {
                                    if viewModel.movieDetails[movie.id] == nil {
                                        await viewModel.getDetails(movie: movie)
                                        await viewModel.getReleaseDates(movie: movie)
                                    }
                                }
                        }
                    }
                }
                .padding(.horizontal, 10)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Movies")
                        .font(.title)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "magnifyingglass")
                }
            }
            .onAppear {
                Task {
                    await viewModel.getMovies()
                }
            }
        }
        .tint(.label)
    }
    
    private func getCertification(for results: ReleaseDateResult) -> String? {
        guard let results = results.results else {
            return nil
        }
        
        for result in results {
            if result.iso3166_1 == "US", let releaseDates = result.releaseDates {
                if let certification = releaseDates.first?.certification {
                    return certification
                }
            }
        }
        
        return nil
    }
}

// MARK: Views
private extension MoviesView {
    var segmentedPicker: some View {
        Picker("Movie Category", selection: $selectedIndex) {
            Text("Now Showing").tag(0)
            Text("Coming Soon").tag(1)
        }
        .pickerStyle(.segmented)
        .colorMultiply(.red)
        .padding()
    }
}

#Preview {
    MoviesView()
}
