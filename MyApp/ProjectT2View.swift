//
//  ProjectT2View.swift
//  MyApp
//
//  Created by 﨑野伊織 on 2021/06/24.
//

import SwiftUI

struct ProjectT2View: View {
    @EnvironmentObject var UData: UserData
    @State var ShowAlertFlag = false
    @State private var selectedNum:Int = 0

    let color: [Color] = [
        Color(red: 0.9, green: 0.3, blue: 0.3, opacity: 0.3),
        Color(red: 0.3, green: 0.6, blue: 0.9, opacity: 0.3),
        Color(red: 0.6, green: 0.8, blue: 0.3, opacity: 0.3),
        Color(red: 0.9, green: 0.8, blue: 0.2, opacity: 0.3),
        Color(red: 0.4, green: 0.4, blue: 0.4, opacity: 0.3)]
    
    var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.M.d"
        return dateFormatter
    }
    
    func x_move(num:Int,size:Int) -> CGFloat{
        return CGFloat(size/4+size/2*Int(num%2))
    }
    
    func y_move(dis:Int,num:Int) -> CGFloat{
        return CGFloat(-num*dis)
    }
    var body: some View {
        VStack {
            GeometryReader{geometory in
                
                ScrollView{
                    VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0, content: {
                        ForEach(0..<UData.RecordFinal.count, id: \.self){n in
                            
                            Button(action: {
                                withAnimation() {
                                    self.ShowAlertFlag.toggle()
                                    self.selectedNum = n
                                }
                            }) {
                                ProjectFile_DeleteView(num:n , FileWidth : CGFloat(geometory.size.width))
                            }
                            .position(x: self.x_move(num: n, size: Int(geometory.size.width)),
                                      y:-30*CGFloat(n)+100)
                            .shadow(color: .gray, radius: 4, x: 10, y: 10)
                            .alert(isPresented: self.$ShowAlertFlag){
                                Alert(title:Text("選択したものを削除しますか？"),
                                      primaryButton:.default(Text("いいえ")),
                                      secondaryButton: .default(Text("はい")){
                                        withAnimation() {
                                            UData.Delete_Project(num: self.selectedNum)
                                        }
                                      })
                            }
                        }
                    })
                }
            }
        }
    }
}

struct ProjectT2View_Previews: PreviewProvider {
    static var previews: some View {
        ProjectT2View()
            .environmentObject(UserData())
    }
}

/*------------------------------------------------*/

struct ProjectFile_DeleteView: View {
    @EnvironmentObject var UData: UserData
    @State var num : Int
    let FileWidth : CGFloat
    let color: [Color] = [
        Color(red: 0.9, green: 0.3, blue: 0.3, opacity: 0.3),
        Color(red: 0.3, green: 0.6, blue: 0.9, opacity: 0.3),
        Color(red: 0.6, green: 0.8, blue: 0.3, opacity: 0.3),
        Color(red: 0.9, green: 0.8, blue: 0.2, opacity: 0.3),
        Color(red: 0.4, green: 0.4, blue: 0.4, opacity: 0.3)]
    var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.M.d"
        return dateFormatter
    }
    var body: some View {
        if UData.RecordFinal.count > num{
            ZStack{
                RoundedRectangle(cornerRadius: 15)
                    .fill(color[num%5])
                    .frame(width: FileWidth/2-20,height: 100)
                
                VStack{
                    Text(UData.RecordDate[num], formatter: dateFormatter)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.gray)
                    Spacer()
                    Text("")
                }.frame(width: FileWidth/2-50,height: 100)
                .background(Color.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .offset(y:-10)
                
                Text(UData.RecordFinal[num])
                    .font(.title3)
                    .fontWeight(.black)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.all)
                    .frame(width: FileWidth/2-20,height: 100)
                    .background(color[num%5])
                    .cornerRadius(15)
                    .offset(y:10)
            }
        }
    }
}

struct ProjectFile_DeleteView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectFile_DeleteView(num: 0, FileWidth: 400)
            .environmentObject(UserData())
    }
}
