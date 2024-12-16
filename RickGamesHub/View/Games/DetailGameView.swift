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
    let timer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()
    @State private var count: Int = 1
    @State private var isFavorite: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ZStack {
                Color.gray.opacity(0.2)
                TabView(selection: $count) {
                    ForEach(game.short_screenshots.indices, id: \.self) { index in
                        WebImage(url: game.short_screenshots[index].screenShotURL)
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
            
            ScrollView{
                VStack(alignment: .leading) {
                    Text(game.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
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
                count = count == game.short_screenshots.count ? 1 : count + 1
            }
        }
        .onAppear{
            vm.getGamesDetail(id: game.id)
            checkIfFavorite()
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
    func checkIfFavorite() {
        let favoriteGames = loadFavoriteGames()
        isFavorite = favoriteGames.contains(where: { $0.id == game.id })
    }
    
    func toggleFavorite(_ game: Game) {
        var favoriteGames = loadFavoriteGames()
        
        if isFavorite {
            favoriteGames.removeAll { $0.id == game.id }
        } else {
            if !favoriteGames.contains(where: { $0.id == game.id }) {
                favoriteGames.append(game)
            }
        }
        
        if let encoded = try? JSONEncoder().encode(favoriteGames) {
            UserDefaults.standard.set(encoded, forKey: "favoriteGames")
        }
        
        isFavorite.toggle()
    }
    
    func loadFavoriteGames() -> [Game] {
        if let data = UserDefaults.standard.data(forKey: "favoriteGames"),
           let decodedGames = try? JSONDecoder().decode([Game].self, from: data) {
            return decodedGames
        }
        return []
    }
}
