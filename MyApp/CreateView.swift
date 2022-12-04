//
//  CreateView.swift
//  MyApp
//
//  Created by 﨑野伊織 on 2021/03/20.
//

import SwiftUI



struct CreateView: View {
    //いらないかも
    //@State var Goaltext: String = ""
    //@State var SubGoals : [String] = []
    @State var newSubGoalText: String = ""
    @State var isShowInfoView = false
    @AppStorage("ShowCreateView") var ShowCreateView = false
    @EnvironmentObject var user: UserProject
    
    var body: some View {
            VStack {
                HStack {
                Spacer()
                Button(action: {
                    self.isShowInfoView.toggle()
                }) {
                    Image(systemName: "questionmark.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .opacity(0.3)
                }.sheet(isPresented: $isShowInfoView){
                    InfoView()
                }//InfoButton
                .offset(x: -30,y:10)
                }
                //fainalgoal入力
                TextField("Final Goal", text: $user.FinalGoal)
                    .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                    .padding(.bottom)
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                //subgoal追加フォーム
                HStack {
                    TextField("Sub Goal", text: $newSubGoalText ,onCommit:{
                        
                    }).textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width:300)
                    Button(action: {
                        if newSubGoalText.count > 0{
                            user.arrayadd(name: newSubGoalText)
                            self.newSubGoalText = ""
                        }
                    }) {
                        Image(systemName:"plus.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                   }
                    
                }
                
                //追加したもののリスト表示と編集処理
                NavigationView{
                    List {
                        ForEach(user.Subgoals, id: \.self) { item in
                                Text(item)
                            }.onDelete { offsets in
                                user.Subgoals.remove(atOffsets: offsets)
                                UserDefaults.standard.set(user.Subgoals, forKey: "Subgoals")
                                user.flags.remove(atOffsets: offsets)
                                UserDefaults.standard.set(user.Subgoals, forKey: "Subgoals")
                            }.onMove(perform: rowReplace)
                    }.navigationBarItems(trailing: EditButton())
                }
                //Let's go ボタン
                Button(action: {
                    self.ShowCreateView.toggle()
                }) {
                    Text("Let's go")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                }.padding()
            
            }//VStack
    }//body
    /// 行入れ替え処理
    func rowReplace(_ from: IndexSet, _ to: Int) {
        user.Subgoals.move(fromOffsets: from, toOffset: to)
        UserDefaults.standard.set(user.Subgoals, forKey: "Subgoals")
        user.flags.move(fromOffsets: from, toOffset: to)
        UserDefaults.standard.set(user.Subgoals, forKey: "Subgoals")
    }
}


struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
            .environmentObject(UserProject())
            
    }
}
