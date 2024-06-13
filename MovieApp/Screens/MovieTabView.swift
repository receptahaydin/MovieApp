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
                .tabItem { Label("movies".localized, systemImage: "film") }
            
            FavoritesView()
                .tabItem { Label("favorites".localized, systemImage: "heart") }
            
            ProfileView()
                .tabItem { Label("profile".localized, systemImage: "person") }
        }
        .accentColor(.movieBlue)
    }
}

#Preview {
    MovieTabView()
}
