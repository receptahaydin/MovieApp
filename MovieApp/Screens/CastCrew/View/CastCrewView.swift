//
//  CastCrewView.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 9.06.2024.
//

import SwiftUI

struct CastCrewView: View {
    let casts: [Cast]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                ForEach(casts, id: \.self) { cast in
                    CastCrewCell(cast: cast)
                }
            }
            .padding()
        }
        .navigationTitle("Cast & Crew")
        .toolbarRole(.editor)
    }
}

#Preview {
    CastCrewView(casts: [])
}
