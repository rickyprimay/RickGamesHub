//
//  Game.swift
//  RickGamesHub
//
//  Created by Ricky Primayuda Putra on 16/12/24.
//

import SwiftUI

struct Game: Identifiable, Codable {
    let id: Int
    let name: String
    let background_image: String
    let rating: Double
    let released: String
    let short_screenshots: [Screenshot]
    let parent_platforms: [Platform]
    
    var backgroundImageURL: URL? {
        return URL(string: background_image)
    }
}

struct GameResult: Codable {
    let results: [Game]
}

struct Screenshot: Codable {
    let image: String
    
    var screenShotURL: URL? {
        return URL(string: image)
    }
}

struct Platform: Codable {
    let platform: PlatformDetails
}

struct PlatformDetails: Codable, Identifiable {
    let id: Int
    let name: String
}
