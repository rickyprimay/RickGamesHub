//
//  SkillToolsView.swift
//  RickGamesHub
//
//  Created by Ricky Primayuda Putra on 17/12/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct SkillToolsView: View {
    var body: some View {
        createSkillToolsItem(with: "https://developer.apple.com/assets/elements/icons/swiftui/swiftui-128x128_2x.png")
        createSkillToolsItem(with: "https://banner2.cleanpng.com/20180504/etq/avdm4z7so.webp")
        createSkillToolsItem(with: "https://developer.apple.com/assets/elements/icons/xcode-12/xcode-12-96x96_2x.png")
        createSkillToolsItem(with: "https://download.logo.wine/logo/IOS/IOS-Logo.wine.png")
    }
    
    func createSkillToolsItem(with imageUrl: String) -> some View {
        WebImage(url: URL(string: imageUrl))
            .resizable()
            .scaledToFit()
            .frame(width: 50, height: 50)
            .clipShape(Rectangle())
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))
    }
    
}
