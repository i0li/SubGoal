//
//  ColorSettingView.swift
//  MyApp
//
//  Created by 﨑野伊織 on 2021/07/05.
//

import SwiftUI

struct ColorSettingView: View {
    @AppStorage("F_BackColor") var F_BackColor: Color = Color(red: 1.0, green: 0.6, blue: 0.2, opacity: 0.8)
    @AppStorage("F_FontColor") var F_FontColor: Color = .white
    @AppStorage("C_BackColor") var C_BackColor: Color = Color(red: 0.3, green: 0.6, blue: 0.9, opacity: 0.8)
    @AppStorage("C_FontColor") var C_FontColor: Color = .white
    var body: some View {
        VStack{
            //FinalSetting
            HStack{
                ColorPicker(selection: $F_BackColor, label: {
                    Text("BackGround")
                        .font(.title2)
                        .fontWeight(.black)
                        .foregroundColor(Color.gray)
                }).frame(width: 180, height: 50, alignment: .bottom)
                .offset(x:20)
                Spacer()
                
                ColorPicker(selection: $F_FontColor, label: {
                    Text("Font")
                        .font(.title2)
                        .fontWeight(.black)
                        .foregroundColor(Color.gray)
                }).frame(width: 100, height: 50, alignment: .bottom)
                .offset(x:-20)
            }
            
            
            
            Text("FinalGoal")
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
                
            
            //CompletedSetting
            HStack{
                ColorPicker(selection: $C_BackColor, label: {
                    Text("BackGround")
                        .font(.title2)
                        .fontWeight(.black)
                        .foregroundColor(Color.gray)
                }).frame(width: 180, height: 50, alignment: .bottom)
                .offset(x:20)
                Spacer()
                
                ColorPicker(selection: $C_FontColor, label: {
                    Text("Font")
                        .font(.title2)
                        .fontWeight(.black)
                        .foregroundColor(Color.gray)
                }).frame(width: 100, height: 50, alignment: .bottom)
                .offset(x:-20)
            }.padding(.top)
                            
            Text("All Completed")
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(C_FontColor)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .padding(.all)
                .background(C_BackColor)
                .cornerRadius(5)
                .padding(.all)
                .shadow(color: .gray, radius: 4, x: 10, y: 10)
        }
    }
}

struct ColorSettingView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSettingView()
    }
}
