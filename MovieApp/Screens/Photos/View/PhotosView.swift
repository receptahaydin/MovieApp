//
//  PhotosView.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 10.06.2024.
//

import SwiftUI

struct PhotosView: View {
    var images: [Backdrop] = []
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                ForEach(images, id: \.self) { image in
                    if let imagePath = image.filePath, let url = URL(string: "http://image.tmdb.org/t/p/w500\(imagePath)") {
                        AsyncImage(url: url) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: .infinity)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        } placeholder: {
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: .infinity)
                        }
                    } else {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Photos".localized)
        .toolbarRole(.editor)
    }
}

#Preview {
    PhotosView()
}
