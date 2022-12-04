//
//  CompletedView.swift
//  MyApp
//
//  Created by 﨑野伊織 on 2021/06/17.
//



import SwiftUI

struct CompletedView: View {
    @State var isBreak = false
    @State var isNew = false
    @State var ShowRecordAlert = false
    @State var ShowNewAlert = false
    @State var selectedDate = Date()
    @AppStorage("ShowCreateView") var ShowCreateView = false
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var user: UserProject
    @EnvironmentObject var UData: UserData
    var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.M.d"
        return dateFormatter
    }
    
    var body: some View {
        
        ScrollView{
        VStack{
            VStack{
                if user.RecordFlag {
                    HStack{
                        Text("Recorded on")
                            .font(.title)
                            .fontWeight(.bold)
                            .fontWeight(.light)
                            .foregroundColor(Color.black)
                            .padding(.top)
                        Text(user.Date, formatter: dateFormatter)
                            .font(.title2)
                            .fontWeight(.light)
                            .foregroundColor(Color.black)
                            .padding(.top)
                    }.animation(.easeInOut(duration: 0.5))
                }
                else{
                    HStack{
                        Text("Record")
                            .font(.title)
                            .fontWeight(.bold)
                            .fontWeight(.light)
                            .foregroundColor(Color.black)
                            .padding(.top)
                        DatePicker(selection: $selectedDate, displayedComponents: .date) {
                            Text("Date")
                            }.labelsHidden().padding(.top)
                    }
                }
                
                Button(action: {
                    self.ShowRecordAlert.toggle()
                }) {
                    ZStack{
                        Circle()
                            .fill(Color.white)
                            .frame(width:150, height: 150)
                            .shadow(color: .gray, radius:user.RecordFlag ? 0:4, x: user.RecordFlag ? 0 : 10, y: user.RecordFlag ? 0 : 10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 75)
                                    .stroke(Color.gray, lineWidth: 3)
                            )
                        Image(systemName:"books.vertical")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 90 , height: 90)
                            .foregroundColor(Color(red: 0.9, green: 0.6, blue: 0.3, opacity: 0.9))
                    }.offset(y: user.RecordFlag ? 5 : 0).animation(.ripple())
                }.alert(isPresented: $ShowRecordAlert){
                    switch(user.RecordFlag) {
                    case false:
                        return Alert(title:
                                        Text("この日付で今回の内容を\n記録しますか？"),
                                     primaryButton:.default(Text("いいえ")),
                                     secondaryButton: .default(Text("はい")){
                                        withAnimation(.easeInOut(duration: 0.5)) {
                                            user.Date = selectedDate
                                            user.ToggleRF()
                                            UData.RecordData(Final:user.FinalGoal,Sub:user.Subgoals,Dat:selectedDate)
                                        }
                                     })
                    case true:
                        return Alert(title: Text("記録済みです"))
                    }
                }
            }.padding(.top)
            
            
            VStack{
                Text("Break")
                    .font(.title)
                    .fontWeight(.bold)
                    .fontWeight(.light)
                    .foregroundColor(Color.black)
                    .padding(.top)
                Button(action: {
                    self.isBreak.toggle()
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    ZStack{
                        Circle()
                            .fill(Color.white)
                            .frame(width:150, height: 150)
                            .shadow(color: .gray, radius:isBreak ? 0:4, x: isBreak ? 0 : 10, y: isBreak ? 0 : 10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 75)
                                    .stroke(Color.gray, lineWidth: 3)
                            )
                        Image(systemName:"leaf")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 90 , height: 90)
                            .foregroundColor(Color(red: 0.4, green: 0.8, blue: 0.2, opacity: 0.9))
                    }.offset(y: isBreak ? 5 : 0).animation(.ripple())
                }
            }.padding(.top)
            
            
            VStack{
                Text("New")
                    .font(.title)
                    .fontWeight(.bold)
                    .fontWeight(.light)
                    .foregroundColor(Color.black)
                    .padding(.top)
                Button(action: {
                    self.ShowNewAlert.toggle()
                }) {
                    ZStack{
                        Circle()
                            .fill(Color.white)
                            .frame(width:150, height: 150)
                            .shadow(color: .gray, radius:isNew ? 0:4, x: isNew ? 0 : 10, y: isNew ? 0 : 10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 75)
                                    .stroke(Color.gray, lineWidth: 3)
                            )
                        Image(systemName:"figure.walk")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 75 , height: 75)
                            .foregroundColor(Color(red: 0.9, green: 0.8, blue: 0.1, opacity: 0.9))
                    }.offset(y: isNew ? 5 : 0).animation(.ripple())
                    .alert(isPresented: $ShowNewAlert){
                        Alert(title:Text("新しく始めますか？"),
                              primaryButton:.default(Text("いいえ")),
                              secondaryButton: .default(Text("はい")){
                                withAnimation(.easeInOut(duration: 0.5)) {
                                    user.ProjectReset()
                                    self.isNew.toggle()
                                    self.presentationMode.wrappedValue.dismiss()
                                    self.ShowCreateView.toggle()
                                }
                              })
                    }
                }
            }.padding(.top)
        }.frame(maxWidth: .infinity)
        }
    }
}

struct CompletedView_Previews: PreviewProvider {
    static var previews: some View {
        CompletedView()
            .environmentObject(UserProject())
            .environmentObject(UserData())
    }
}
