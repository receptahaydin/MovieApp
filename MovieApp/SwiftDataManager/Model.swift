//
//  Model.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 13.06.2024.
//

import Foundation
import SwiftData

@Model
class Movie {
    @Attribute(.unique) let id: Int
    
    init(id: Int) {
        self.id = id
    }
}
