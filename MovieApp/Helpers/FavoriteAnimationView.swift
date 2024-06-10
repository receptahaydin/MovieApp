//
//  FavoriteAnimationView.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 10.06.2024.
//

import SwiftUI

struct FavoriteAnimationView: View {
    @State private var opacity: CGFloat = 0.0
    @State private var scaleHeart: CGFloat = 0.0
    @State private var scaleText: CGFloat = 1
    @Binding var isLiked: Bool
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    Image(systemName: "heart")
                        .foregroundColor(.white)
                    
                    Image(systemName: "heart")
                        .foregroundColor(.pink)
                        .animation(Animation.interpolatingSpring(stiffness: 170, damping: 10).delay(0.25))
                    
                    Image(systemName: "heart.fill")
                        .foregroundColor(.pink)
                        .scaleEffect(scaleHeart)
                        .animation(Animation.interpolatingSpring(stiffness: 170, damping: 10).delay(0.5))
                }
                .onTapGesture {
                    isLiked.toggle()
                    opacity += 1
                    scaleHeart += 1
                    scaleText = 1.2
                    if !isLiked {
                        scaleHeart = 0
                        isLiked = false
                        scaleText = 1
                    }
                }
            }
        }
    }
}

#Preview {
    FavoriteAnimationView(isLiked: .constant(true))
}
