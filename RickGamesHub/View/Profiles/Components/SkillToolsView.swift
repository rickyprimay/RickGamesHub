//
//  SkillToolsView.swift
//  RickGamesHub
//
//  Created by Ricky Primayuda Putra on 17/12/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct SkillToolsView: View{
    var body: some View {
        WebImage(url: URL(string: "https://developer.apple.com/assets/elements/icons/swiftui/swiftui-128x128_2x.png"))
            .resizable()
            .scaledToFit()
            .frame(width: 50, height: 50)
            .clipShape(Rectangle())
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))
        
        WebImage(url: URL(string: "https://banner2.cleanpng.com/20180504/etq/avdm4z7so.webp"))
            .resizable()
            .scaledToFit()
            .frame(width: 50, height: 50)
            .clipShape(Rectangle())
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))
        
        WebImage(url: URL(string: "https://developer.apple.com/assets/elements/icons/xcode-12/xcode-12-96x96_2x.png"))
            .resizable()
            .scaledToFit()
            .frame(width: 50, height: 50)
            .clipShape(Rectangle())
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))
        
        WebImage(url: URL(string: "https://download.logo.wine/logo/IOS/IOS-Logo.wine.png"))
            .resizable()
            .scaledToFit()
            .frame(width: 50, height: 50)
            .clipShape(Rectangle())
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))
    }
}
