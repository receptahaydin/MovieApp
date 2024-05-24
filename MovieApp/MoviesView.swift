//
//  ContentView.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 22.05.2024.
//

import SwiftUI

struct MoviesView: View {
    
    @StateObject var viewModel = MoviesView.ViewModel()
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    MovieCardView()
                    MovieCardView()
                    MovieCardView()
                    MovieCardView()
                    MovieCardView()
                    MovieCardView()
                    MovieCardView()
                    MovieCardView()
                    MovieCardView()

                }
            }
            .navigationTitle("Movies")
        }
    }
}

#Preview {
    MoviesView()
}
