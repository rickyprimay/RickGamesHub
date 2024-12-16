//
//  GameCardView.swift
//  RickGamesHub
//
//  Created by Ricky Primayuda Putra on 16/12/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct GameCardView: View {
    let game: Game
    @ObservedObject var vm: GameViewModel
    @State private var isFavorite: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            WebImage(url: game.backgroundImageURL)
                .resizable()
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .scaledToFill()
                .frame(width: 340, height: 200)
                .clipped()
                .background(
                    Rectangle()
                        .fill(Color(red: 61/255, green: 61/255, blue: 88/255))
                        .frame(width: 340, height: 200)
                )
            
            VStack {
                HStack {
                    Text(game.name)
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .frame(maxWidth: 280, alignment: .leading)
                    Spacer()
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(isFavorite ? .red : .gray)
                        .onTapGesture {
                            isFavorite.toggle()
                            Task {
                                
                            }
                        }
                }
                
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
                HStack {
                    Text("Release Date: \(game.released)")
                        .font(.subheadline)
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                }

            }
            .padding()
            .background(.gray)
        }
        .cornerRadius(10)
    }
    
}

#Preview{
    HomeView()
}
