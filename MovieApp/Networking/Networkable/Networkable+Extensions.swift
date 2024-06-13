//
//  Networkable+Extensions.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 22.05.2024.
//

import Foundation

extension Networkable {
    func getRequest(
        queryItem: [String : String] = [:],
        path: String,
        httpMethod: RequestMethod = .get,
        language: Bool? = false
    ) async -> URLRequest {
        var url = API.prepareUrl(withPath: path)
        var queryItems = queryItem
        queryItems["api_key"] = Bundle.main.apiKey
        
        if language == true {
            let languageCode = Locale.current.language.languageCode?.identifier ?? "en"
            queryItems["language"] = languageCode
        }
        
        url = url.adding(parameters: queryItems)
        let request = await prepareRequest(url: url,
                                           method: httpMethod,
                                           contentType: ContentType.json)
        return request
    }
    
    private func prepareRequest(
        url: URL,
        method: RequestMethod,
        contentType: ContentType
    ) async -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = API.getHeader(contentType: contentType)
        return request
    }
}
