//
//  FavoritesView.swift
//  RickGamesHub
//
//  Created by Ricky Primayuda Putra on 17/12/24.
//

import SwiftUI

struct FavoritesView: View {
    @StateObject private var viewModel = FavoritesViewModel()
    
    var body: some View {
        NavigationView {
            if !viewModel.favorites.isEmpty {
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.favorites, id: \.self) { game in
                            NavigationLink {
                                let screenshots = (game.shortScreenshots?.allObjects as? [ShortScreenshot] ?? []).map { ShortScreenshot in
                                    Screenshot(image: ShortScreenshot.image ?? "")
                                }
                                DetailGameView(game: Game(
                                    id: Int(game.id),
                                    name: game.name ?? "Unknown",
                                    backgroundImage: game.backgroundImage ?? "",
                                    rating: game.rating,
                                    released: game.released ?? "Unknown",
                                    shortScreenshots: screenshots
                                ))
                            } label: {
                                ResultSearchView(game: Game(
                                    id: Int(game.id),
                                    name: game.name ?? "Unknown",
                                    backgroundImage: game.backgroundImage ?? "",
                                    rating: game.rating,
                                    released: game.released ?? "Unknown",
                                    shortScreenshots: [] 
                                ))
                            }
                        }
                    }
                    .padding(.top)
                    .navigationTitle("Favorite Games")
                }
            } else {
                Text("No favorite games yet")
                    .font(.title)
                    .foregroundStyle(.gray)
                    .navigationTitle("Favorite Games")
            }
        }
        .onAppear {
            viewModel.getFavorites()
        }
    }
}
