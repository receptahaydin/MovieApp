//
//  MovieTabView.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 24.05.2024.
//

import SwiftUI

struct MovieTabView: View {
    var body: some View {
        TabView {
            MoviesView()
                .tabItem { Label("Movies", systemImage: "film") }
            
            FavoritesView()
                .tabItem { Label("Favorites", systemImage: "heart") }
            
            ProfileView()
                .tabItem { Label("Profile", systemImage: "person") }
        }
        .accentColor(.movieBlue)
    }
}

#Preview {
    MovieTabView()
}
