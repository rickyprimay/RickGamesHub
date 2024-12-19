//
//  FavoritesViewModel.swift
//  RickGamesHub
//
//  Created by Ricky Primayuda Putra on 19/12/24.
//

import SwiftUI
import CoreData

class FavoritesViewModel: ObservableObject {
    
    let manager = CoreDataManager.instance
    @Published var favorites: [FavoritesGames] = []
    
    init() {
        getFavorites()
    }
    
    func getFavorites() {
        let request: NSFetchRequest<FavoritesGames> = FavoritesGames.fetchRequest()
        
        do {
            favorites = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching favorites. \(error.localizedDescription)")
        }
    }
    
    func addFavorite(game: Game) {
        let newFavorite = FavoritesGames(context: manager.context)
        
        newFavorite.id = Int32(game.id)
        newFavorite.name = game.name
        newFavorite.rating = game.rating
        newFavorite.released = game.released
        newFavorite.backgroundImage = game.backgroundImage
        
        for screenshot in game.shortScreenshots {
            let newScreenshot = ShortScreenshot(context: manager.context)
            newScreenshot.image = screenshot.screenShotURL?.absoluteString
            newScreenshot.games = newFavorite
        }
        
        saveChanges()
    }
    
    func removeFavorite(game: Game) {
        if let favoriteToRemove = favorites.first(where: { $0.id == game.id }) {
            manager.context.delete(favoriteToRemove)
            saveChanges()
        }
    }
    
    func isGameFavorite(game: Game) -> Bool {
        return favorites.contains(where: { $0.id == game.id })
    }
    
    private func saveChanges() {
        do {
            try manager.context.save()
            getFavorites()
        } catch {
            print("Error saving data: \(error.localizedDescription)")
        }
    }
}
