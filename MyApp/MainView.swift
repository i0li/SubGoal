//
//  MainView.swift
//  MyApp
//
//  Created by 﨑野伊織 on 2021/03/21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ProjectView()
                .tabItem {
                    Image(systemName: "figure.walk")
            
            }
            ProjectTableView()
                .tabItem {
                Image(systemName: "books.vertical")
            }
            SettingView()
                .tabItem {
                    Image(systemName: "gear")
                    }
                .animation(.spring(dampingFraction: 0.8))
        }
        .font(.headline)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(UserProject())
            .environmentObject(UserData())
    }
}
