//
//  MyAppApp.swift
//  MyApp
//
//  Created by 﨑野伊織 on 2021/03/20.
//

import SwiftUI

@main
struct MyAppApp: App {
    @StateObject var user = UserProject()
    @StateObject var UData = UserData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(user)
                .environmentObject(UData)
        }
    }
}
