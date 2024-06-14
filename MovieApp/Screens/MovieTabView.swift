//
//  MovieTabView.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 24.05.2024.
//

import SwiftUI

struct MovieTabView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            MoviesView()
                .tabItem { Label("movies".localized, systemImage: "film") }
                .tag(0)
            
            FavoritesView(selectedTab: $selectedTab)
                .tabItem { Label("favorites".localized, systemImage: "heart") }
                .tag(1)
            
            ProfileView()
                .tabItem { Label("profile".localized, systemImage: "person") }
                .tag(2)
        }
        .accentColor(.movieBlue)
    }
}

#Preview {
    MovieTabView()
}
