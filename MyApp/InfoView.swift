//
//  InfoView.swift
//  MyApp
//
//  Created by 﨑野伊織 on 2021/03/23.
//

import SwiftUI

struct InfoView:View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
            TabView {
                //1ページ目
                ZStack {
                    VStack{
                        Image("FinalGoal_Image")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:350)
                            .cornerRadius(10)
                            .shadow(color: .gray, radius: 4, x: 10, y: 10)
                        Text("あなたがなりたいと思う姿や達成したい目標を設定しましょう")
                            .font(.title)
                            .fontWeight(.light)
                            .foregroundColor(Color.white)
                            .padding(.all)
                            .shadow(color: .gray, radius: 4, x: 10, y: 10)
                    }
                    
                }
                //2ページ目
                ZStack {
                    VStack{
                        Image("SubGoal_Image")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:350)
                            .cornerRadius(10)
                            .shadow(color: .gray, radius: 4, x: 10, y: 10)
                        Text("達成するために必要なことを考え、それを小さな目標として設定しましょう。\n \nできるだけ簡単な目標を")
                            .font(.title)
                            .fontWeight(.light)
                            .foregroundColor(Color.white)
                            .padding(.all)
                            .shadow(color: .gray, radius: 4, x: 10, y: 10)
                        Text("")
                        (Text("最終目標\n")
                            .font(.title2)
                            .fontWeight(.bold)
                            + Text("ダイエット\n")
                            + Text("\n小さな目標\n")
                            .font(.title2)
                            .fontWeight(.bold)
                            + Text("生活習慣を見直す\nお菓子を食べない\n１週間毎日ウォーキングをする\nメニューに腹筋を追加\n…など"))
                            .foregroundColor(Color.gray)
                            .multilineTextAlignment(.leading)
                            .padding(.all)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                    }
                }
                //3ページ目
                ZStack {
                    VStack{
                        Image("List_Image")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:350)
                            .cornerRadius(10)
                            .shadow(color: .gray, radius: 4, x: 10, y: 10)
                        Text("右上の『Edit』を使い簡単なものが上になるように順番を並び替えましょう")
                            .font(.title)
                            .fontWeight(.light)
                            .foregroundColor(Color.white)
                            .padding(.all)
                            .shadow(color: .gray, radius: 4, x: 10, y: 10)
                    }
                }
                //4ページ目
                ZStack {
                    VStack{
                        Image("Let'sgo_Image")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                            .shadow(color: .gray, radius: 4, x: 10, y: 10)
                            .padding(.all)
                        Text("順番を並び終えたら\nボタンを押しましょう！")
                            .font(.title)
                            .fontWeight(.light)
                            .foregroundColor(Color.white)
                            .padding(.all)
                            .shadow(color: .gray, radius: 4, x: 10, y: 10)
                        
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("閉じる")
                                .font(.title2)
                                .fontWeight(.medium)
                                .foregroundColor(Color(red: 0.3, green: 0.6, blue: 0.9, opacity: 0.6))
                                .padding(.all)
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(color: .gray, radius: 0, x: 0, y: 2)
                        }.offset(y:100)
                    }
                }
                
            }//table
            .tabViewStyle(PageTabViewStyle())
            .background(Color(red: 0.3, green: 0.6, blue: 0.9, opacity: 0.4))
        
        
        
        
    }
        
}//struct


struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
        //ContentView()
    }
}
//最終目標：ダイエット\n\n小さな目標\n\n生活習慣を見直す\nお菓子を食べない\n１週間毎日ウォーキングをする\nメニューに腹筋を追加\n…など
/*.font(.body)
.fontWeight(.bold)
.foregroundColor(Color.gray)
.multilineTextAlignment(.leading)
.padding(.all)
.border(Color.gray)
 */

