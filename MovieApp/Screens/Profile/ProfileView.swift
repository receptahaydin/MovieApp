//
//  ProfileView.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 24.05.2024.
//

import SwiftUI

struct ProfileView: View {
    
    @AppStorage("darkMode") var isDarkMode: Bool = false

    var body: some View {
        VStack {
            ScrollView {
                Spacer()
                    .frame(height: 100)
                
                ZStack {
                    Circle()
                        .stroke(
                            LinearGradient(
                                gradient: Gradient(colors: [.label, .movieBlue]),
                                startPoint: .center,
                                endPoint: .bottom
                            ),
                            lineWidth: 3
                        )
                        .frame(width: 110, height: 100)
                    
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .fontWeight(.ultraLight)
                }
                .padding()
                
                Text("welcome_text".localized)
                    .font(.title2)
                
                Spacer()
                    .frame(height: 100)
                
                VStack {
                    Toggle(isOn: $isDarkMode) {
                        Text("dark_mode".localized)
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    ProfileView()
}
