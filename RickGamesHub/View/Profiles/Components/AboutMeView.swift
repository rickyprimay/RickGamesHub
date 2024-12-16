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
        
        
        Text("I fell in love with programming and I have at least learnt something, I think… 🤷‍♂️. ")
            .font(.body)
            .foregroundColor(.gray)
            .lineSpacing(5)
            .padding(.top, 10)
        
        Text("I am fluent in programming languages​​ like Javascript, Swift(I am Very Love IT!), Dart, PHP, and Go.")
            .font(.body)
            .foregroundColor(.gray)
            .lineSpacing(5)
            .padding(.top, 10)
        
        Text("My field of Interest's are building new  Web Technologies and Mobile Apps and also in areas related to Machine Learning.")
            .font(.body)
            .foregroundColor(.gray)
            .lineSpacing(5)
            .padding(.top, 10)
        
        Text("Whenever possible, I also apply my passion for developing products with Node.js and Modern Javascript Library and Frameworks  like React.js, Svelte and Next.js And now I am very love and interested with SwiftUI and UIKit for Native iOS.")
            .font(.body)
            .foregroundColor(.gray)
            .lineSpacing(5)
            .padding(.top, 10)
    }
}
