//
//  ResultSearchView.swift
//  RickGamesHub
//
//  Created by Ricky Primayuda Putra on 17/12/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ResultSearchView: View {
    
    var game: Game
    
    var body: some View {
        HStack {
            WebImage(url: game.backgroundImageURL)
                .resizable()
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .scaledToFill()
                .frame(width: 80, height: 120)
                .background(
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 80, height: 120)
                )
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text(game.name)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .font(.headline)
                
                HStack {
                    Text(String(format: "%.2f", game.rating))
                            .foregroundColor(.white)
                            .fontWeight(.heavy)
                    
                    ForEach(0..<Int(game.rating), id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                    
                    if game.rating - floor(game.rating) >= 0.5 {
                        Image(systemName: "star.lefthalf.fill")
                            .foregroundColor(.yellow)
                    }
                    
                    ForEach(0..<5 - Int(game.rating.rounded(.down)) - (game.rating - floor(game.rating) >= 0.5 ? 1 : 0), id: \.self) { _ in
                        Image(systemName: "star")
                            .foregroundColor(.yellow)
                    }
                    
                    
                    
                    Spacer()
                }
                .foregroundColor(.yellow)
                .fontWeight(.heavy)
                
                Text("Released: \(game.released)")
                    .foregroundColor(.white)
                    .font(.subheadline)
            }
            Spacer()
        }
        .padding()
        .background(.gray)
        .cornerRadius(20)
        .padding(.horizontal)
    }
}

