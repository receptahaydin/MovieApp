//
//  FilmCardView.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 24.05.2024.
//

import SwiftUI

struct MovieCardView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Image("testPoster")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 250)
                    
                    HStack(spacing: 2) {
                        Image(systemName: "star.fill")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 14, height: 14)
                        Image(systemName: "star.fill")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 14, height: 14)
                        Image(systemName: "star.fill")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 14, height: 14)
                        Image(systemName: "star.fill")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 14, height: 14)
                        Image(systemName: "star.fill")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 14, height: 14)
                    }
                    .padding(.top, 5)
         
                    Text("John Wick 3")
                        .font(.system(size: 16))
                        .fontWeight(.medium)

                    Text("Crime • 2hr 10m")
                        .font(.system(size: 12))
                        .fontWeight(.medium)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
}

#Preview {
    MovieCardView()
}
