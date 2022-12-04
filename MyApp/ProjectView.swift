//
//  ProjectView.swift
//  MyApp
//
//  Created by 﨑野伊織 on 2021/03/24.
//

import SwiftUI

struct ProjectView: View {
    @EnvironmentObject var user: UserProject
    @State var ShowAlertFlags = Array(repeating: false, count: UserProject().Subgoals.count)
    
    @AppStorage("F_BackColor") var F_BackColor: Color = Color(red: 1.0, green: 0.6, blue: 0.2, opacity: 0.8)
    @AppStorage("F_FontColor") var F_FontColor: Color = .white
    @AppStorage("C_BackColor") var C_BackColor: Color = Color(red: 0.3, green: 0.6, blue: 0.9, opacity: 0.8)
    @AppStorage("C_FontColor") var C_FontColor: Color = .white
    
    @State var isShow = false
    
    var body: some View {
        VStack{
            if user.flags == Array(repeating: true, count: user.flags.count) {
                Button(action: {
                    withAnimation() {
                        self.isShow.toggle()
                    }
                }, label: {
                    Text("All Completed")
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(C_FontColor)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .padding(.all)
                        .background(isShow ? Color.gray : C_BackColor)
                        .cornerRadius(5)
                        .padding(.all)
                        .shadow(color: .gray, radius: 4, x: 10, y: 10)
                }).sheet(isPresented: $isShow) {
                    CompletedView()
                }.transition(.slide)
                .animation(.ripple())
                .frame(maxWidth: .infinity)
                .offset(y:10)
            }
            
            else{
                Text(user.FinalGoal)
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(F_FontColor)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                    .padding(.all)
                    .background(F_BackColor)
                    .cornerRadius(1)
                    .padding(.all)
                    .shadow(color: .gray, radius: 4, x: 10, y: 10)
                    .offset(y:10)
            }

            ScrollView{
                VStack{
                    if user.Subgoals == [] {
                        Text("")
                    }
                    else{
                        ForEach(0..<user.Subgoals.count, id: \.self) { n in
                            Button(action: {
                                if self.user.AlertFlags[n] == true{
                                    self.user.AlertFlags[n] = false
                                }else{
                                    self.user.AlertFlags[n] = true
                                }
                                //self.user.AlertFlags[n].toggle()
                            }) {
                                Text(user.Subgoals[n])
                                    .font(.title2)
                                    .fontWeight(.black)
                                    .foregroundColor(Color.black)
                                    .multilineTextAlignment(.center)
                                    .frame(maxWidth: 200)
                                    .padding(.all)
                                    .background(user.flags[n] ? Color.gray.opacity(0.3) : Color.white)
                                    .cornerRadius(5)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color.black, lineWidth: 2)
                                    )
                                    .padding(.all)
                                    .shadow(color: .gray, radius:user.flags[n] ? 0:4, x: user.flags[n] ? 0 : 5, y: user.flags[n] ? 0 : 5)
                                    .offset(y: user.flags[n] ? 5 : 0)
                                
                            }.alert(isPresented: $user.AlertFlags[n]) {
                                switch(user.flags[n]) {
                                case false:
                                    return Alert(title:
                                                    Text("お疲れ様！ \n達成できましたか？"),
                                                 primaryButton:.default(Text("いいえ")),
                                                 secondaryButton: .default(Text("はい")){
                                                    user.Fupdate(num: n)
                                                 })
                                case true:
                                    return Alert(title: Text("やり直す"),
                                                 message: Text("もう一度この目標に挑戦しますか？"),
                                                 primaryButton:.default(Text("いいえ")),
                                                 secondaryButton: .default(Text("はい")){
                                                    user.Fupdate(num: n)
                                                 })
                                }
                            }
                        }
                    }
                    
                }.frame(maxWidth: .infinity)
            }
        }
    }
}


        
struct ProjectView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectView()
            .environmentObject(UserProject())
    }
}
