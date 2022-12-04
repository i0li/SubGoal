//
//  Project_DetailView.swift
//  MyApp
//
//  Created by 﨑野伊織 on 2021/06/29.
//

import SwiftUI

struct Project_DetailView: View {
    @EnvironmentObject var UData: UserData
    let FinalGoal : String
    let SubGoals : [String]
    var body: some View {
        ScrollView(){
            VStack{
                Text("").padding()
                HStack{
                    Text("　最終目標")
                        .foregroundColor(Color.gray)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    Spacer()
                }
                Text(self.FinalGoal)
                    .foregroundColor(Color.black)
                    .font(.title)
                    .padding(.bottom)
                
                Divider()
                    .frame(maxWidth: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                HStack{
                    Text("\n　小さな目標")
                    .foregroundColor(Color.gray)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                    Spacer()
                }
                
                ForEach(0..<self.SubGoals.count, id: \.self){n in
                    Text("○ "+self.SubGoals[n])
                        .foregroundColor(Color.black)
                        .font(.title2)
                        .padding(EdgeInsets(
                            top: 0,
                            leading: 40,
                            bottom: 20,
                            trailing: 40
                        ))
                }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                Spacer()
            }.frame(maxWidth:.infinity)
        }
    }
}

struct Project_DetailView_Previews: PreviewProvider {
    static var previews: some View {
        Project_DetailView(FinalGoal: "最終目標", SubGoals: ["ダイエット","走る","食事制限","生活習慣","ジムに通う"])
            .environmentObject(UserData())
    }
}
