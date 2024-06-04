//
//  MovieDetailView.swift
//  MovieApp
//
//  Created by Recep Taha Aydın on 26.05.2024.
//

import SwiftUI
import Kingfisher

struct MovieDetailView: View {
    
    let movie: TopRatedMovie
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                ScrollView {
                    VStack {
                        Image("testPoster")
                            .resizable()
                            .scaledToFill()
                            .frame(height: geo.size.height / 3, alignment: .top)
                            .clipped()
                            .blur(radius: 2.5, opaque: true)
                        
                        Image("testPoster")
                            .resizable()
                            .scaledToFit()
                            .frame(height: geo.size.height / 3)
                            .padding(.top, -geo.size.height / 5.5)
                        
                        VStack(spacing: 10) {
                            Text("John Wick 3: Parabellum")
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            Text("2hr 10m | R")
                                .font(.callout)
                                .foregroundStyle(.secondary)
                            
                            Text("Action, Crime, Thriller")
                                .font(.callout)
                                .foregroundStyle(.secondary)
                        }
                        .multilineTextAlignment(.center)
                        .padding()
                        
                        HStack {
                            Text("4.6/5")
                                .font(.title)
                            
                            StarsRatingView(rating: 5, widthHeight: 20)
                        }
                        
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Synopsis")
                                .font(.headline)
                            
                            Text("In this third installment of the adrenaline-fueled action franchise, super-assassin John Wick returns with a $14 million price tag on his head and an army of bounty-hunting...")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        .padding()
                        
                        Button {
                            
                        } label: {
                            DetailViewButton(title: "Show More")
                        }
                        
                        VStack(alignment: .leading, spacing: 15) {
                            HStack {
                                Text("Cast & Crew")
                                    .font(.headline)
                                
                                Spacer()
                                
                                Button {
                                    
                                } label: {
                                    DetailViewButton(title: "View All")
                                }
                            }
                            
                            ForEach(0..<5, id: \.self) { _ in
                                CastCrewCell()
                            }
                        }
                        .padding()
                        
                        VStack {
                            HStack {
                                Text("Photos")
                                    .font(.headline)
                                
                                Spacer()
                                
                                Button {
                                    
                                } label: {
                                    DetailViewButton(title: "View All")
                                }
                            }
                            .padding()
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(0..<7, id: \.self) { _ in
                                        Image(.moviePhoto)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 104, height: 72)
                                    }
                                }
                            }
                            .padding(.leading)
                        }
                    }
                }
                .ignoresSafeArea(edges: .top)
            }
            .toolbarRole(.editor)
        }
    }
}

#Preview {
    MovieDetailView(movie: TopRatedMovie(id: 1, genreIDS: [0], popularity: 1.0, posterPath: "", title: "Jack Reacher", voteAverage: 9))
}
