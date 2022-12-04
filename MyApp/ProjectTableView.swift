//
//  ProjectTableView.swift
//  MyApp
//
//  Created by 﨑野伊織 on 2021/03/24.
//

import SwiftUI

struct ProjectTableView: View {
    @EnvironmentObject var UData: UserData
    @State var DeleteModeFlag = false
    var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.M.d"
        return dateFormatter
    }
    var body: some View {
            if UData.RecordFinal.count == 0 {
                NoProjectView()
            }else{
                VStack{
                    Text("")
                    HStack{
                        Button(action: {
                            if DeleteModeFlag{
                                
                            }else{
                                withAnimation(){
                                    UData.StackFlag.toggle()
                                }
                            }
                        }) {
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                               .fill(Color.white)
                                    .frame(width:130, height: 50)
                                    .shadow(color: .gray,
                                            radius:UData.StackFlag ? 0:4,
                                            x: UData.StackFlag ? 0 : 10,
                                            y: UData.StackFlag ? 0 : 10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.gray, lineWidth: 3)
                                    )
                                Image(systemName:"square.3.stack.3d")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 30 , height: 30)
                                    .foregroundColor(Color.gray)
                            }.offset(y: UData.StackFlag ? 5 : 0)
                            .padding([.leading,.trailing,.top])
                        }
                        
                        Button(action: {
                            withAnimation(){
                                self.DeleteModeFlag.toggle()
                            }
                        }) {
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                               .fill(Color.white)
                                    .frame(width:130, height: 50)
                                    .shadow(color: .gray,
                                            radius:self.DeleteModeFlag ? 0:4,
                                            x: self.DeleteModeFlag ? 0 : 10,
                                            y: self.DeleteModeFlag ? 0 : 10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.gray, lineWidth: 3)
                                    )
                                
                                Image(systemName:"trash")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 30 , height: 30)
                                    .foregroundColor(Color.gray)
                            }.offset(y: self.DeleteModeFlag ? 5 : 0)
                            .padding([.leading,.trailing,.top])
                        }
                    }
                    
                    Divider()
                        .background(self.DeleteModeFlag ? Color.red :Color.black)
                        .offset(y:8)
                    
                    if DeleteModeFlag{
                        ProjectT2View()
                            .transition(.move(edge: .bottom)).animation(.spring(dampingFraction: 0.8))
                    }
                    else{
                        ProjectT1View()
                            .transition(.move(edge: .bottom)).animation(.spring(dampingFraction: 0.8))
                    }
                }
            }
    }
}

struct ProjectTableView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectTableView()
            .environmentObject(UserData())
    }
}
