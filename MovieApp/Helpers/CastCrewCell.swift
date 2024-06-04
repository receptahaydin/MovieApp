//
//  CastCrewCell.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 4.06.2024.
//

import SwiftUI

struct CastCrewCell: View {
    var body: some View {
        HStack {
            Image(.testProfile)
                .resizable()
                .scaledToFill()
                .frame(width: 49, height: 49)
                .clipShape(.circle)
            
            Text("Keanu Reeves")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(.leading, 12)
            
            Spacer()
            Text("•••")
                .foregroundStyle(.secondary)
                .padding(.trailing, 24)

            Text("JOHN WICK")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    CastCrewCell()
}
