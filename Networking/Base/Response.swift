//
//  Response.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 22.05.2024.
//

import Foundation

public struct Response<T: Decodable>: Decodable {
    public var results: T?
}
