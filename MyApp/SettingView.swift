//
//  SettingView.swift
//  MyApp
//
//  Created by 﨑野伊織 on 2021/03/24.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject var UData: UserData
    @EnvironmentObject var user: UserProject
    @State var isShowClearAllAlert = false
    @State var isShow_EditFinalView = false
    @State var isShow_EditSubView = false
    
    @AppStorage("F_BackColor") var F_BackColor: Color = Color(red: 1.0, green: 0.6, blue: 0.2, opacity: 0.8)
    @AppStorage("F_FontColor") var F_FontColor: Color = .white
    @AppStorage("C_BackColor") var C_BackColor: Color = Color(red: 0.3, green: 0.6, blue: 0.9, opacity: 0.8)
    @AppStorage("C_FontColor") var C_FontColor: Color = .white
    
    func removeUserDefaults() {
        let appDomain = Bundle.main.bundleIdentifier
        UserDefaults.standard.removePersistentDomain(forName: appDomain!)
    }
    
    var body: some View {
        ScrollView{
            VStack{
                Text("")
                HStack{
                    VStack{
                        // Edit Final Button
                        
                        Button(action: {
                            withAnimation(){
                                self.isShow_EditFinalView.toggle()
                                self.isShow_EditSubView = false
                            }
                        }) {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 10)
                                                   .fill(Color.white)
                                        .frame(width:130, height: 50)
                                        .shadow(color: .gray,
                                                radius:self.isShow_EditFinalView ? 0:4,
                                                x: self.isShow_EditFinalView ? 0 : 10,
                                                y: self.isShow_EditFinalView ? 0 : 10)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color.gray, lineWidth: 3)
                                        )
                                    
                                    if self.isShow_EditFinalView == true{
                                        Text("変更")
                                            .font(.title2)
                                            .fontWeight(.black)
                                            .foregroundColor(Color.gray)
                                    }else{
                                        Text("Edit Final")
                                            .font(.title2)
                                            .fontWeight(.black)
                                            .foregroundColor(Color.gray)
                                    }
                                    
                                }.padding([.leading,.trailing,.top])

                        }.offset(y: self.isShow_EditFinalView ? 5 : 0)
                    }
                    
                    
                    VStack{
                        // Edit Sub Button
                        Button(action: {
                            withAnimation(){
                                self.isShow_EditSubView.toggle()
                                self.isShow_EditFinalView = false
                            }
                        }) {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 10)
                                                   .fill(Color.white)
                                        .frame(width:130, height: 50)
                                        .shadow(color: .gray,
                                                radius:self.isShow_EditSubView ? 0:4,
                                                x: self.isShow_EditSubView ? 0 : 10,
                                                y: self.isShow_EditSubView ? 0 : 10)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color.gray, lineWidth: 3)
                                        )
                                    
                                    if self.isShow_EditSubView == true{
                                        Text("変更")
                                            .font(.title2)
                                            .fontWeight(.black)
                                            .foregroundColor(Color.gray)
                                    }else{
                                        Text("Edit Sub")
                                            .font(.title2)
                                            .fontWeight(.black)
                                            .foregroundColor(Color.gray)
                                    }
                                    
                                }.padding([.leading,.trailing,.top])
                        }.offset(y: self.isShow_EditSubView ? 5 : 0)
                    }
                    
                }
                
                Divider()
                    .background(Color.black)
                    .offset(y:8)
                
                VStack{
                    Text("")
                    if isShow_EditFinalView==true{
                        EditFinalView(isShow_EditFinalView: self.$isShow_EditFinalView)
                            .transition(.slide)
                            .animation(.easeInOut(duration: 0.2))
                    }else if isShow_EditSubView == true{
                        EditSubView(isShow_EditSubView: self.$isShow_EditSubView)
                            .transition(.slide)
                            .animation(.easeInOut(duration: 0.2))
                    }else{
                        ColorSettingView()
                            .transition(.slide)
                            .animation(.easeInOut(duration: 0.2))
                    }
                }
                
                
                /*
                Divider().padding()
                
                // ClearAll Button
                Button(action: {
                    self.isShowClearAllAlert.toggle()
                }) {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                           .fill(Color.white)
                                .frame(width:300, height: 50)
                                .shadow(color: .gray, radius:4, x: 10, y: 10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color(red: 0.9, green: 0.3, blue: 0.3, opacity: 0.8), lineWidth: 5)
                                )
                            
                            Text("Clear All")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(Color(red: 0.9, green: 0.3, blue: 0.3, opacity: 0.8))
                            
                        }.padding([.leading,.trailing])
                }.alert(isPresented: $isShowClearAllAlert){
                    Alert(title: Text("データを初期化しますか？"),
                                 message: Text("初期化すると元のデータは二度と復元でませんがよろしいですか？"),
                                 primaryButton:.default(Text("いいえ")),
                                 secondaryButton: .default(Text("はい")){
                                    removeUserDefaults()
                                 })
                }
                .padding()
                */
                
            }
        }
        
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
            .environmentObject(UserProject())
            .environmentObject(UserData())
    }
}
