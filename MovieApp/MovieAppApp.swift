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
    var body: some Scene {
        WindowGroup {
            MovieTabView()
                .modifier(ThemeViewModifier())
        }
        .modelContainer(for: Movie.self)
    }
}
