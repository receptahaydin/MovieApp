//
//  ContentView.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 22.05.2024.
//

import SwiftUI
import SwiftData

struct MoviesView: View {
    @StateObject var viewModel = MoviesViewModel()
    @State private var selectedIndex = 0
    @State private var searchText = ""
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                segmentedPicker
                
                LazyVGrid(columns: columns) {
                    ForEach(filteredMovies, id: \.id) { movie in
                        MovieCardView(details: viewModel.movieDetails[movie.id],
                                      certification: getCertification(for: viewModel.releaseDates[movie.id] ?? ReleaseDateResult(results: [])))
                        .task {
                            if viewModel.movieDetails[movie.id] == nil {
                                await viewModel.getDetails(movieID: movie.id)
                                await viewModel.getReleaseDates(movieID: movie.id)
                            }
                        }
                    }
                }
                .padding(.horizontal, 10)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("movies".localized)
                        .font(.title)
                }
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "search".localized)
        }
        .tint(.label)
    }
    
    private var filteredMovies: [MovieResponse] {
        if searchText.isEmpty {
            return viewModel.movies
        } else {
            return viewModel.movies.filter {
                $0.title.lowercased().contains(searchText.lowercased())
            }
        }
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
    
    private func loadMovies() {
        Task {
            if selectedIndex == 0 {
                if !viewModel.nowPlayingMovies.isEmpty {
                    viewModel.movies = viewModel.nowPlayingMovies
                } else {
                    await viewModel.getMovies(type: .nowPlaying)
                }
            } else {
                if !viewModel.upComingMovies.isEmpty {
                    viewModel.movies = viewModel.upComingMovies
                } else {
                    await viewModel.getMovies(type: .upComing)
                }
            }
        }
    }
}

// MARK: Views
private extension MoviesView {
    var segmentedPicker: some View {
        Picker("Movie Category", selection: $selectedIndex) {
            Text("now_showing".localized).tag(0)
            Text("coming_soon".localized).tag(1)
        }
        .pickerStyle(.segmented)
        .colorMultiply(.movieBlue)
        .padding()
        .onChange(of: selectedIndex) {
            loadMovies()
        }
        .onAppear {
            loadMovies()
        }
    }
}

#Preview {
    MoviesView()
}
