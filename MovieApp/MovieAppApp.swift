//
//  MovieAppApp.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 22.05.2024.
//

import SwiftUI
import SwiftData

@main
struct MovieAppApp: App {
    @State private var showSplash = true
    
    var body: some Scene {
        WindowGroup {
            if showSplash {
                SplashView(isLoading: $showSplash)
            } else {
                MovieTabView()
                    .modifier(ThemeViewModifier())
            }
        }
        .modelContainer(for: Movie.self)
    }
}
