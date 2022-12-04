//
//  ContentView.swift
//  MyApp
//
//  Created by 﨑野伊織 on 2021/03/20.
//

import SwiftUI


extension Animation {
   static func ripple() -> Animation {
    Animation.spring(dampingFraction: 0.5)
   }
}

struct ContentView: View {
    @AppStorage("ShowCreateView") var ShowCreateView = true
    
    var body: some View {
        if ShowCreateView  {
            CreateView().transition(.scale)
        }
        else {
            MainView()
                .transition(.slide)
                .animation(.ripple())
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            ContentView()
                .environmentObject(UserProject())
                .environmentObject(UserData())
             
        }
    }
}

