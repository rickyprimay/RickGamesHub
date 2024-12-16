//
//  ProfilesView.swift
//  RickGamesHub
//
//  Created by Ricky Primayuda Putra on 17/12/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProfilesView: View {
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack {
                    VStack {
                        WebImage(url: URL(string: "https://media.licdn.com/dms/image/v2/D5603AQE4tfQC5I-oEA/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1731940782636?e=1740009600&v=beta&t=pxuyhc1aBMQh1OAeb9FpV1R9nyPW9qgggiSGSXi74Po"))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            .shadow(radius: 10)
                            .padding(.top, 30)
                    }
                    
                    VStack(alignment: .leading, spacing: 15) {
                        AboutMeView()
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
                    
                    Spacer()
                }
            }
            
            .navigationTitle("Profile")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Link(destination: URL(string: "https://rickyprimay.me")!) {
                        Image(systemName: "network")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                            .frame(width: 50, height: 50)
                            .background(.gray)
                            .cornerRadius(10)
                            .padding(.bottom)
                    }
                }
            }
        }
    }
}

#Preview {
    ProfilesView()
}

