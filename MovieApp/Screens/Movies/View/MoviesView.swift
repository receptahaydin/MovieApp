//
//  ContentView.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 22.05.2024.
//

import SwiftUI

struct MoviesView: View {
    
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
                        NavigationLink(destination: MovieDetailView(movie: movie)) {
                            MovieCardView(movie: movie, genre: genreName(for: movie.genreIDS[0]) ?? "")
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
                    async let moviesResult: () = viewModel.getMovies()
                    async let genresResult: () = viewModel.getGenres()
                    
                    await moviesResult
                    await genresResult
                }
            }
        }
        .tint(.label)
    }
    
    private func genreName(for genreID: Int) -> String? {
        if let genre = viewModel.genres.first(where: { $0.id == genreID }) {
            return genre.name
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
