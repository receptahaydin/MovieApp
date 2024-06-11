//
//  Int+Extensions.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 11.06.2024.
//

import Foundation

extension Int {
    func toHoursMinutes() -> String {
        let hours = self / 60
        let minutes = self % 60
        
        return "\(hours)hr \(minutes)m"
    }
}
