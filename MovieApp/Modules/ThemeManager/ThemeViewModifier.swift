//
//  ThemeViewModifier.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 13.06.2024.
//

import SwiftUI

public struct ThemeViewModifier: ViewModifier {
    
    @AppStorage("darkMode") var isDarkMode: Bool = false
    
    public func body(content: Content) -> some View {
        content
            .environment(\.colorScheme, isDarkMode ? .dark : .light)
            .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}
