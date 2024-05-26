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
        NavigationView {
            ScrollView {
                Picker("Movie Category", selection: $selectedIndex) {
                    Text("Now Showing").tag(0)
                    Text("Coming Soon").tag(1)
                }
                .pickerStyle(.segmented)
                .colorMultiply(.red)
                .padding()
                
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.movies, id: \.id) { movie in
                        NavigationLink(destination: MovieDetailView(movie: movie)) {
                            MovieCardView(movie: movie)
                        }
                    }
                }
                .padding(.horizontal, 10)
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
            
            
        }
    }
}

#Preview {
    MoviesView()
}
