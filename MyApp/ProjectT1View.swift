//
//  ProjectT1View.swift
//  MyApp
//
//  Created by 﨑野伊織 on 2021/06/24.
//

import SwiftUI

struct ProjectT1View: View {
    @EnvironmentObject var UData: UserData
    @State var OpenFlag : Bool = false
    @State private var selectedNum:Int = 0
    
    func x_move(num:Int,size:Int) -> CGFloat{
        return CGFloat(size/4+size/2*Int(num%2))
    }
    
    func y_move(dis:Int,num:Int) -> CGFloat{
        return CGFloat(-num*dis)
    }
    var body: some View {
        VStack {
            GeometryReader{geometory in
                let Half = geometory.size.width/2
                ScrollView{
                    VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0, content: {
                        ForEach(0..<UData.RecordFinal.count, id: \.self){n in
                            Button(action: {
                                withAnimation() {
                                    self.selectedNum = n
                                    UData.SlideFlags[selectedNum]=true
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    self.OpenFlag.toggle()
                                }
                            }) {
                                ProjectFileView(num:n , FileWidth:CGFloat(geometory.size.width))
                            }
                            .position(x:0,y:100)
                            .offset(x:UData.StackFlag ? Half : self.x_move(num: n, size: Int(geometory.size.width)),
                                    y:UData.StackFlag ? -70*CGFloat(n):-30*CGFloat(n))
                            .shadow(color: .gray, radius: 4, x: 10, y: 10)
                            .sheet(isPresented: self.$OpenFlag,
                                   onDismiss: {
                                    withAnimation() {UData.SlideFlags[selectedNum]=false}
                                   }){
                                Project_DetailView(
                                    FinalGoal: UData.RecordFinal[self.selectedNum],
                                    SubGoals: UData.RecordSub[self.selectedNum])
                            }
                        }
                    })
                }
            }
        }
    }
}

struct ProjectT1View_Previews: PreviewProvider {
    static var previews: some View {
        ProjectT1View()
            .environmentObject(UserData())
    }
}

/*-------------------------------------------------------------*/

struct ProjectFileView: View {
    @EnvironmentObject var UData: UserData
    let num : Int
    let FileWidth : CGFloat
    let color: [Color] = [
        Color(red: 0.9, green: 0.3, blue: 0.3, opacity: 0.8),
        Color(red: 0.3, green: 0.6, blue: 0.9, opacity: 0.8),
        Color(red: 0.6, green: 0.8, blue: 0.3, opacity: 0.8),
        Color(red: 0.9, green: 0.8, blue: 0.2, opacity: 0.8),
        Color(red: 0.4, green: 0.4, blue: 0.4, opacity: 0.8)]
    var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.M.d"
        return dateFormatter
    }
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .fill(color[num%5])
                .frame(width: CGFloat(FileWidth/2)-20,height: 100)
            
            VStack{
                Text(UData.RecordDate[num], formatter: dateFormatter)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))
                Spacer()
            }.frame(width: CGFloat(FileWidth/2)-50,height: 100)
            .background(Color.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.black, lineWidth: 1)
            )
            .offset(y:-10)
            .offset(y: UData.SlideFlags[num] ? -20 : 0)
            
            Text(UData.RecordFinal[num])
                .font(.title3)
                .fontWeight(.black)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .padding(.all)
                .frame(width: CGFloat(FileWidth/2)-20,height: 100)
                .background(color[num%5])
                .cornerRadius(15)
                .offset(y:10)
        }
    }
}

struct ProjectFileView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectFileView(num: 0, FileWidth: 400)
            .environmentObject(UserData())
    }
}
