//
//  EditFinalView.swift
//  MyApp
//
//  Created by 﨑野伊織 on 2021/07/05.
//

import SwiftUI

struct EditFinalView: View {
    @EnvironmentObject var user: UserProject
    @AppStorage("F_BackColor") var F_BackColor: Color = Color(red: 1.0, green: 0.6, blue: 0.2, opacity: 0.8)
    @AppStorage("F_FontColor") var F_FontColor: Color = .white
    @Binding var isShow_EditFinalView:Bool
    var body: some View {
        VStack{
            Text("FinalGoal")
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(F_FontColor)
                .multilineTextAlignment(.center)
                .frame(maxWidth: 200,maxHeight: 20)
                .padding(.all)
                .background(F_BackColor)
                .cornerRadius(1)
                .shadow(color: .gray, radius: 4, x: 10, y: 10)
                .padding()
            
            Group{
                TextField("Final Goal", text: $user.FinalGoal).textFieldStyle(RoundedBorderTextFieldStyle())
                .font(.title)
                    .padding()
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                /*
                    Button(action: {
                        self.isShow_EditFinalView.toggle()
                    }) {
                        ZStack{
                            RoundedRectangle(cornerRadius: 5)
                                           .fill(Color.white)
                                .frame(width:150, height: 50)
                                .shadow(color: .gray, radius:4, x: 10, y: 10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.gray, lineWidth: 3)
                                )
                            
                            Text("変更")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                        }
                    }.padding()
 */
            }
        }
        
    }
}

struct EditFinalView_Previews: PreviewProvider {
    static var previews: some View {
        EditFinalView( isShow_EditFinalView: .constant(true))
            .environmentObject(UserProject())
    }
}
