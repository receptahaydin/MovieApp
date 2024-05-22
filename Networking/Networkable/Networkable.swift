//
//  Networkable.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 22.05.2024.
//

import Foundation

public protocol Networkable {
    func request() async -> URLRequest
}

public extension Networkable {
    func fetch<T: Decodable>(requestModel model: T.Type) async -> Result<T, Error> {
        do {
            let (data, response) = try await URLSession.shared.data(for: request(), delegate: nil)
            
            guard let response = response as? HTTPURLResponse else {
                return .failure(NSError.generic)
            }
            
            switch response.statusCode {
            case 401:
                return .failure(NSError.generic)

            default:
                if let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers),
                   let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) {
                    print("-----------------------------------")
                    print("-----------------------------------")
                    print(String(decoding: jsonData, as: UTF8.self))
                    print("-----------------------------------")
                    print("-----------------------------------")
                }
                
                if model.self is Data.Type {
                    return .success(data as! T)
                }
                
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let decodingData = try decoder.decode(Response<T>.self, from: data)
                
                if let body = decodingData.results {
                    return .success(body)
                } else {
                    return .failure(NSError.generic)
                }
            }
        } catch {
            return .failure(NSError.generic)
        }
    }
}
