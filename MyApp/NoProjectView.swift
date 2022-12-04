//
//  NoProjectView.swift
//  MyApp
//
//  Created by 﨑野伊織 on 2021/06/29.
//

import SwiftUI

struct NoProjectView: View {
    @State var ShowSheetFlag = false
    var body: some View {
        VStack{
            
            Text("頑張って最初の目標を\n達成してみましょう")
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.center)
                .padding(.all)
            
            Button(action: {
                self.ShowSheetFlag.toggle()
            }) {
                Image(systemName: "questionmark.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .opacity(0.3)
                    .padding(.all)
            }.sheet(isPresented: self.$ShowSheetFlag){
                PT_InfoView()
            }
            
        }
    }
}

struct NoProjectView_Previews: PreviewProvider {
    static var previews: some View {
        NoProjectView()
    }
}

/*==================================================================================*/

struct PT_InfoView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        TabView{
            //1ページ目
            ZStack{
                VStack{
                    Text("ここではあなたがこれまでに達成してきた目標を見ることができます\n")
                        .font(.title)
                        .fontWeight(.light)
                        .foregroundColor(Color.white)
                        .padding(.all)
                        .shadow(color: .gray, radius: 4, x: 10, y: 10)
                }
            }.tabItem{}
            //2ページ目
            ZStack{
                VStack{
                    Image("PTInfo1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth:.infinity)
                        .cornerRadius(10)
                        .padding(.leading)
                        .padding(.trailing)

                    Text("全ての項目を達成すると\n表示が変わります")
                        .font(.title)
                        .fontWeight(.light)
                        .foregroundColor(Color.white)
                        .padding(.all)
                        .shadow(color: .gray, radius: 4, x: 10, y: 10)
                }
            }.tabItem{}
            //3ページ目
            ZStack{
                VStack{
                    /*ZStack{
                        RoundedRectangle(cornerRadius: 5)
                                        .fill(Color.white)
                                        .frame(width:350, height: 150)
                                        .padding()
                        HStack{
                            ZStack{
                                Circle()
                                    .fill(Color.white)
                                    .frame(width:90, height: 90)
                                    .shadow(color: .gray, radius:4, x: 10, y: 10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 75)
                                            .stroke(Color.gray, lineWidth: 3)
                                    )
                                Image(systemName:"books.vertical")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50 , height: 50)
                                    .foregroundColor(Color(red: 0.9, green: 0.6, blue: 0.3, opacity: 0.9))
                            }
                            
                            ZStack{
                                Circle()
                                    .fill(Color.white)
                                    .frame(width:90, height: 90)
                                    .shadow(color: .gray, radius:4, x: 10, y: 10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 75)
                                            .stroke(Color.gray, lineWidth: 3)
                                    )
                                Image(systemName:"leaf")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50 , height: 50)
                                    .foregroundColor(Color(red: 0.4, green: 0.8, blue: 0.2, opacity: 0.9))
                            }.padding()
                            
                            ZStack{
                                Circle()
                                    .fill(Color.white)
                                    .frame(width:90, height: 90)
                                    .shadow(color: .gray, radius:4, x: 10, y: 10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 75)
                                            .stroke(Color.gray, lineWidth: 3)
                                    )
                                Image(systemName:"figure.walk")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40 , height: 40)
                                    .foregroundColor(Color(red: 0.9, green: 0.8, blue: 0.1, opacity: 0.9))
                            }
                        }
                    }*/
                    Image("PTInfo2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth:.infinity)
                        .cornerRadius(10)
                        .padding()
                    
                    Text("押すと３つのボタンが\n出現します\n\n茶色のボタンを押すことで\n今回の内容を保存できます")
                        .font(.title)
                        .fontWeight(.light)
                        .foregroundColor(Color.white)
                        .padding(.all)
                        .shadow(color: .gray, radius: 4, x: 10, y: 10)
                }
            }.tabItem{}
            //4ページ目
            ZStack{
                VStack{
                    Text("これから様々な目標に挑戦してそれを自分の手で達成していきましょう！")
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
            }.tabItem{}
        }.tabViewStyle(PageTabViewStyle())
        .background(Color(red: 0.3, green: 0.6, blue: 0.9, opacity: 0.4))
    }
}

struct PT_InfoView_Previews: PreviewProvider {
    static var previews: some View {
        PT_InfoView()
    }
}
