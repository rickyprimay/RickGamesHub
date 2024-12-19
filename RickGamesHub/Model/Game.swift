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
    let backgroundImage: String
    let rating: Double
    let released: String
    let shortScreenshots: [Screenshot]
    
    var backgroundImageURL: URL? {
        return URL(string: backgroundImage)
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name, rating, released
        case backgroundImage = "background_image"
        case shortScreenshots = "short_screenshots"
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
