//
//  FavoriteMoviesView.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 24.05.2024.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {
    @StateObject private var viewModel = FavoritesViewModel()
    @Query private var movies: [Movie]
    @Binding var selectedTab: Int
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(movies, id: \.id) { movie in
                        MovieCardView(details: viewModel.movieDetails[movie.id],
                                      certification: getCertification(for: viewModel.releaseDates[movie.id] ?? ReleaseDateResult(results: [])))
                    }
                }
            }
            .padding(.horizontal, 10)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("favorites".localized)
                        .font(.title)
                }
            }
            .overlay {
                if movies.isEmpty {
                    ContentUnavailableView(label: {
                        Label {
                            Text("no_favorite".localized)
                        } icon: {
                            Image(systemName: "popcorn.fill")
                                .foregroundStyle(.movieBlue)
                        }
                    }, description: {
                        Text("start_adding".localized)
                    }, actions: {
                        Button("add_movie".localized) { selectedTab = 0 }
                            .foregroundStyle(.movieBlue)
                    })
                }
            }
            .onAppear {
                Task {
                    for movie in movies {
                        async let detailResult: () = viewModel.getDetails(movieID: movie.id)
                        async let releaseDatesResult: () = viewModel.getReleaseDates(movieID: movie.id)
                        
                        await detailResult
                        await releaseDatesResult
                    }
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

#Preview {
    FavoritesView(selectedTab: .constant(0))
}
