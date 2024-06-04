//
//  StarsRatingView.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 25.05.2024.
//

import SwiftUI

struct StarsRatingView: View {
    
    var rating: Double
    
    var body: some View {
        HStack(spacing: 2) {
            ForEach(0..<5, id: \.self) { index in
                ZStack {
                    Image(systemName: "star")
                        .renderingMode(.original)
                        .resizable()
                    
                    if rating > Double(index) {
                        GeometryReader { geometry in
                            let width = min(max(CGFloat(rating - Double(index)), 0), 1) * geometry.size.width
                            ZStack(alignment: .leading) {
                                Rectangle()
                                    .foregroundColor(.yellow)
                                    .frame(width: width)
                            }
                        }
                        .mask(
                            Image(systemName: "star.fill")
                                .resizable()
                        )
                    }
                }
                .frame(width: 14, height: 14)
            }
        }
    }
}

#Preview {
    StarsRatingView(rating: 3.4)
}
