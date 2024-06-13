//
//  FavoriteAnimationView.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 10.06.2024.
//

import SwiftUI
import SwiftData

struct FavoriteAnimationView: View {
    @Environment(\.modelContext) var context
    @Query var movies: [Movie] = []
    @State private var opacity: CGFloat = 0.0
    @State private var scaleHeart: CGFloat = 0.0
    @State private var scaleText: CGFloat = 1
    @Binding var isLiked: Bool
    var movieID: Int
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    Image(systemName: "heart")
                        .foregroundColor(.white)
                    
                    Image(systemName: "heart")
                        .foregroundColor(.red)
                        .animation(Animation.interpolatingSpring(stiffness: 170, damping: 10).delay(0.25))
                    
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                        .scaleEffect(isLiked ? 1.0 : 0.0)
                        .animation(Animation.interpolatingSpring(stiffness: 170, damping: 10).delay(0.5))
                }
                .onTapGesture {
                    isLiked.toggle()
                    opacity += 1
                    scaleHeart = isLiked ? 1.0 : 0.0
                    scaleText = isLiked ? 1.2 : 1.0
                    
                    if isLiked {
                        let movie = Movie(id: movieID)
                        context.insert(movie)
                    } else {
                        if let index = movies.firstIndex(where: { $0.id == movieID }) {
                            context.delete(movies[index])
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    FavoriteAnimationView(isLiked: .constant(true), movieID: 0)
}
