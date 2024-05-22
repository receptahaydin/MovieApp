//
//  API.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 22.05.2024.
//

import Foundation

public enum API {
    static func prepareUrl(withPath path: String) -> URL {
        guard let baseURL = Bundle.main.infoForKey("BASE_URL") else {
            fatalError("Could not create BaseURL")
        }
        
        guard let url = URL(string: "\(baseURL)\(path)") else {
            fatalError("Could not create url")
        }
        
        return url
    }
    
    static func getHeader(contentType: ContentType) -> [String : String] {
        var headers: [String : String] = [:]
        //header["Authorizaition"] = "Bearer"
        headers["Content-Type"] = contentType.rawValue
        return headers
    }
}
