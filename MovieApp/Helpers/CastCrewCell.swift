//
//  CastCrewCell.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 4.06.2024.
//

import SwiftUI

struct CastCrewCell: View {
    let cast: Cast
    
    var body: some View {
        HStack {
            if let profilePath = cast.profilePath, let url = URL(string: "http://image.tmdb.org/t/p/w500\(profilePath)") {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 49, height: 49)
                        .clipShape(Circle())
                } placeholder: {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 49, height: 49)
                        .clipShape(Circle())
                }
            } else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 49, height: 49)
                    .clipShape(Circle())
            }
            
            Text(cast.name ?? "")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(.leading, 12)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("•••")
                .foregroundStyle(.secondary)
            
            Text(cast.character ?? "")
                .font(.caption)
                .foregroundStyle(.secondary)
                .frame(width: 100, alignment: .center)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    CastCrewCell(cast: Cast(name: "Keanu Reeves", profilePath: "", character: "John Wick"))
}
