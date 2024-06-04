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
        httpMethod: RequestMethod = .get
    ) async -> URLRequest {
        var url = API.prepareUrl(withPath: path)
        url.append(queryItems: [.init(name: "api_key", value: Bundle.main.apiKey)])
        let request = await prepareRequest(url: url,
                                           method: httpMethod,
                                           contentType: ContentType.json)
        return request
    }
    
    func postRequest<T: Decodable> (
        data: T,
        path: String,
        httpMethod: RequestMethod = .post
    ) async -> URLRequest {
        var url = API.prepareUrl(withPath: path)
        url.append(queryItems: [.init(name: "api_key", value: Bundle.main.apiKey)])
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
