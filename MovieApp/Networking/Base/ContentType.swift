//
//  ContentType.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 22.05.2024.
//

import Foundation

enum ContentType {
    case json
    case multipartFromData
    
    var rawValue: String {
        switch self {
        case .json:
            "application/json"
        case .multipartFromData:
            ""
        }
    }
}
