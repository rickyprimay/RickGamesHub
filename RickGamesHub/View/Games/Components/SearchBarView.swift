//
//  SearchBarView.swift
//  RickGamesHub
//
//  Created by Ricky Primayuda Putra on 16/12/24.
//

import SwiftUI


struct SearchBarView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            TextField("Search game here...", text: $searchText)
                .padding(10)
                .background(.gray)
                .cornerRadius(10)
                .foregroundColor(.white)
                .font(.system(size: 16))
            
            Image(systemName: "magnifyingglass")
                .foregroundColor(.white)
                .padding(.trailing, 10)
        }
        .padding(.horizontal, 10)
        .background(.gray)
        .cornerRadius(15)
    }
}

