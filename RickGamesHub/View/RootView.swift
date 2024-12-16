//
//  RootView.swift
//  RickGamesHub
//
//  Created by Ricky Primayuda Putra on 16/12/24.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
            FavoritesView()
                .tabItem{
                    Image(systemName: "star")
                    Text("Favorites")
                }
            ProfilesView()
                .tabItem{
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
}

#Preview {
    RootView()
}
