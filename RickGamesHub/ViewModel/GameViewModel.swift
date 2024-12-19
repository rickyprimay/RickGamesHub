//
//  GameViewModel.swift
//  RickGamesHub
//
//  Created by Ricky Primayuda Putra on 16/12/24.
//

import SwiftUI
import Combine

class GameViewModel: ObservableObject {
    
    static var apiKey: String {
        guard let key = Bundle.main.object(forInfoDictionaryKey: "Api_key") as? String else {
            fatalError("API Key not found in Info.plist")
        }
        return key
    }
    
    let baseUrl = "https://api.rawg.io/api/"
    var cancelable = Set<AnyCancellable>()
    @Published var filteredGames: [Game] = []
    
    @Published var games: [Game] = []
    @Published var randomGames: [Game] = []
    @Published var gameDetail: GameDetail? = nil
    
    private var searchSubject = PassthroughSubject<String, Never>()
    
    let randomGamesCount = 5
    
    init(){
        getGames()
        
        searchSubject
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .sink(receiveValue: { [weak self] term in
                self?.searchGames(term: term)
            })
            .store(in: &cancelable)
    }
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode <= 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
    
    private func selectRandomGames() {
        if !games.isEmpty {
            let shuffledGames = games.shuffled()
            let numberOfGames = min(randomGamesCount, shuffledGames.count)
            
            self.randomGames = Array(shuffledGames.prefix(numberOfGames))
        }
    }
    
    func getGames() {
        guard let url = URL(string: "\(baseUrl)games?key=\(GameViewModel.apiKey)") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: GameResult.self, decoder: JSONDecoder())
            .replaceError(with: GameResult(results: []))
            .sink(receiveValue: { [weak self] (returnedPosts) in
                self?.games = returnedPosts.results
                self?.selectRandomGames()
                self?.filteredGames = self?.games ?? []
            })
            .store(in: &cancelable)
    }
    
    func getGamesDetail(id: Int) {
        guard let url = URL(string: "\(baseUrl)games/\(id)?key=\(GameViewModel.apiKey)") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: GameDetail.self, decoder: JSONDecoder())
            .replaceError(with: GameDetail(description_raw: "Unknown result"))
            .sink(receiveValue: { [weak self] (gameDetail) in
                self?.gameDetail = gameDetail
            })
            .store(in: &cancelable)
    }
    
    func searchGames(term: String) {
        guard !term.isEmpty else {
            filteredGames = games
            return
        }
        
        guard let url = URL(string: "https://api.rawg.io/api/games?key=\(GameViewModel.apiKey)&search=\(term.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: GameResult.self, decoder: JSONDecoder())
            .replaceError(with: GameResult(results: []))
            .sink(receiveValue: { [weak self] (returnedPosts) in
                self?.filteredGames = returnedPosts.results
            })
            .store(in: &cancelable)
    }
    
    func updateSearchTerm(_ term: String) {
        searchSubject.send(term)
    }
    
}
