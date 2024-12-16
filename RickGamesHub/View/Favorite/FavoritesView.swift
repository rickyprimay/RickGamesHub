//
//  FavoritesView.swift
//  RickGamesHub
//
//  Created by Ricky Primayuda Putra on 17/12/24.
//

import SwiftUI

struct FavoritesView: View {
    
    @State private var favoriteGames: [Game] = []
    
    var body: some View {
        NavigationView {
            if !favoriteGames.isEmpty{
                ScrollView {
                    LazyVStack {
                        ForEach(favoriteGames) { game in
                            NavigationLink {
                                DetailGameView(game: game)
                            } label: {
                                ResultSearchView(game: game)
                            }
                        }
                    }
                    .padding(.top)
                    .navigationTitle("Favorite Games")
                }
            } else {
                Text("No favorites games yet")
                    .font(.title)
                    .foregroundStyle(.gray)
                    .navigationTitle("Favorite Games")
            }
        }
        .onAppear {
            loadFavoriteGames()
        }
    }
    
    func loadFavoriteGames() {
        if let data = UserDefaults.standard.data(forKey: "favoriteGames"),
           let decodedGames = try? JSONDecoder().decode([Game].self, from: data) {
            favoriteGames = decodedGames
        } else {
            favoriteGames = []
        }
    }
}

