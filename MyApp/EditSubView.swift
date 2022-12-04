//
//  EditSubView.swift
//  MyApp
//
//  Created by 﨑野伊織 on 2021/07/05.
//

import SwiftUI

struct EditSubView: View {
    @EnvironmentObject var user: UserProject
    @Binding var isShow_EditSubView:Bool
    @State var newSubGoalText: String = ""
    var body: some View {
        VStack{
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
                
            }.padding()
            
            NavigationView{
                List{
                    ForEach(user.Subgoals, id: \.self) { item in
                            Text(item)
                    }
                    .onDelete { offsets in
                        user.Subgoals.remove(atOffsets: offsets)
                        UserDefaults.standard.set(user.Subgoals, forKey: "Subgoals")
                        user.flags.remove(atOffsets: offsets)
                        UserDefaults.standard.set(user.flags, forKey: "user.flags")
                        user.AlertFlags.remove(atOffsets: offsets)
                        UserDefaults.standard.set(user.AlertFlags, forKey: "user.AlertFlags")}
                    .onMove(perform: self.rowReplace)
                }
                .toolbar {
                        ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                            EditButton()
                        }
                }
            }.frame(height: 44*CGFloat(user.Subgoals.count)+100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            
            /*
            Button(action: {
                self.isShow_EditSubView.toggle()
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
    
    func rowReplace(_ from: IndexSet, _ to: Int) {
        user.Subgoals.move(fromOffsets: from, toOffset: to)
        UserDefaults.standard.set(user.Subgoals, forKey: "Subgoals")
        
        user.flags.move(fromOffsets: from, toOffset: to)
        UserDefaults.standard.set(user.flags, forKey: "flags")
        
        user.AlertFlags.move(fromOffsets: from, toOffset: to)
        UserDefaults.standard.set(user.AlertFlags, forKey: "AlertFlags")
    }
}

struct EditSubView_Previews: PreviewProvider {
    static var previews: some View {
        EditSubView(isShow_EditSubView: .constant(true))
            .environmentObject(UserProject())
    }
}

