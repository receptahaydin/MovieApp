//
//  ContentView.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 22.05.2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentView.ViewModel()
    
    var body: some View {
        VStack {
            List($viewModel.movies, id: \.title) { movie in
                HStack {
                    Text(movie.wrappedValue.title ?? "")
                }
            }
            .listStyle(.plain)
        }
        .padding()
        .task {
            await viewModel.getMovies()
        }
    }
}

#Preview {
    ContentView()
}
