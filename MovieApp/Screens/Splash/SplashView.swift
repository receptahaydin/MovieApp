//
//  SplashView.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 13.06.2024.
//

import SwiftUI

struct SplashView: View {
    @Binding var isLoading: Bool
    @State private var opacity: Double = 0.0
    @State private var scale: CGFloat = 0.8
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.darkRed, .lightRed]),
                               startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
                
                Image("splashIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geometry.size.width * 0.4, height: geometry.size.width * 0.4)
                    .opacity(opacity)
                    .scaleEffect(scale)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.5)) {
                            opacity = 1.0
                            scale = 1.0
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            isLoading = false
                        }
                    }
            }
        }
    }
}

#Preview {
    SplashView(isLoading: .constant(true))
}
