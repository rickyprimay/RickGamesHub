//
//  DetailGameView.swift
//  RickGamesHub
//
//  Created by Ricky Primayuda Putra on 17/12/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailGameView: View {
    let game: Game
    @StateObject var vm = GameViewModel()
    @StateObject var favoritesVM = FavoritesViewModel()
    let timer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()
    @State private var count: Int = 1
    @State private var isFavorite: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ZStack {
                Color.gray.opacity(0.2)
                TabView(selection: $count) {
                    ForEach(game.shortScreenshots.indices, id: \.self) { index in
                        WebImage(url: game.shortScreenshots[index].screenShotURL)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .cornerRadius(10)
                            .tag(index + 1)
                            .clipped()
                    }
                }
                .frame(height: 200)
                .cornerRadius(10)
                .tabViewStyle(PageTabViewStyle())
                .padding()
            }
            .frame(height: 200)
            .cornerRadius(10)
            .padding(.horizontal)
            
            ScrollView {
                VStack(alignment: .leading) {
                    Text(game.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    HStack {
                        Text(String(format: "%.2f", game.rating))
                            .foregroundColor(.black)
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
                        
                        Text("Released: \(game.released)")
                            .foregroundColor(.black)
                            .font(.subheadline)
                    }
                    .foregroundColor(.yellow)
                    .fontWeight(.heavy)
                    
                    Text("Game Description")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    Text(vm.gameDetail?.description_raw ?? "")
                        .font(.body)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                        .lineSpacing(5)
                    
                    Spacer()
                }
                .padding()
            }
        }
        .onReceive(timer) { _ in
            withAnimation(.default) {
                count = count == game.shortScreenshots.count ? 1 : count + 1
            }
        }
        .onAppear {
            vm.getGamesDetail(id: game.id)
            isFavorite = favoritesVM.isGameFavorite(game: game)
        }
        .navigationBarTitle("Detail", displayMode: .inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Image(systemName: isFavorite ? "star.fill" : "star")
                    .foregroundColor(.black)
                    .onTapGesture {
                        toggleFavorite(game)
                    }
            }
        }
    }
    
    func toggleFavorite(_ game: Game) {
        if isFavorite {
            favoritesVM.removeFavorite(game: game)
        } else {
            favoritesVM.addFavorite(game: game)
        }
        isFavorite.toggle()
    }
}
