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
        }
        .modelContainer(for: Movie.self)
    }
}
