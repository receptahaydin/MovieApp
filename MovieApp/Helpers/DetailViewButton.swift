//
//  DetailViewButton.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 4.06.2024.
//

import SwiftUI

struct DetailViewButton: View {
    
    let title: String
    
    var body: some View {
        Text(title)
            .font(.subheadline)
            .foregroundStyle(.movieBlue)
    }
}

#Preview {
    DetailViewButton(title: "Test")
}
