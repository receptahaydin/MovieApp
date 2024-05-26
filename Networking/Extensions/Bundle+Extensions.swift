//
//  Bundle+Extensions.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 22.05.2024.
//

import Foundation

public extension Bundle {
    func infoForKey(_ key: String) -> String? {
        (infoDictionary?[key] as? String)?.replacingOccurrences(of: "\\", with: "")
    }
    
    var apiKey: String {
        return infoForKey("API_KEY") ?? ""
    }
}
