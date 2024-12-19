//
//  AboutMeView.swift
//  RickGamesHub
//
//  Created by Ricky Primayuda Putra on 17/12/24.
//

import SwiftUI

struct AboutMeView: View {
    var body: some View {
        Text("Ricky Primayuda Putra")
            .font(.title)
            .fontWeight(.bold)
        
        Text("Software Engineer | Be a iOS Developer(amin)")
            .font(.subheadline)
            .foregroundColor(.gray)
        
        Text("My Professional Skillset & Tools")
            .font(.headline)
            .padding(.top, 20)
        
        HStack(spacing: 20) {
            SkillToolsView()
        }
        .padding(.top, 10)
        
        
        Text("My self description: ")
            .font(.headline)
            .padding(.top, 20)
        
        createParagraph("I fell in love with programming and I have at least learnt something, I think… 🤷‍♂️.")
        createParagraph("I am fluent in programming languages like Javascript, Swift(I am Very Love IT!), Dart, PHP, and Go.")
        createParagraph("My field of Interest's are building new  Web Technologies and Mobile Apps and also in areas related to Machine Learning.")
        createParagraph("Whenever possible, I also apply my passion for developing products SwiftUI and UIKit for Native iOS.")
    }
    
    func createParagraph(_ textContent: String) -> some View {
        Text(textContent)
            .font(.body)
            .foregroundColor(.gray)
            .lineSpacing(5)
            .padding(.top, 10)
    }
    
}
