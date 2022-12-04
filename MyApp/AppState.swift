//
//  AppState.swift
//  MyApp
//
//  Created by 﨑野伊織 on 2021/06/20.
//

import Foundation
import SwiftUI
import UIKit

class UserProject: ObservableObject {
    
    @Published var FinalGoal: String {
        didSet{
            UserDefaults.standard.set(FinalGoal, forKey: "FinalGoal")
        }
    }
    @Published var Subgoals : [String]
    @Published var flags : [Bool]
    @Published var AlertFlags : [Bool]
    {
        didSet{
            UserDefaults.standard.set(AlertFlags, forKey: "AlertFlags")
        }
    }
    @Published var Date : Date
    {
        didSet{
            UserDefaults.standard.set(Date, forKey: "Date")
        }
    }
    @Published var RecordFlag : Bool
    

    func arrayadd(name:String){
        Subgoals.append(name)
        UserDefaults.standard.set(Subgoals, forKey: "Subgoals")
        flags.append(false)
        UserDefaults.standard.set(flags, forKey: "flags")
        AlertFlags.append(false)
        UserDefaults.standard.set(AlertFlags, forKey: "AlertFlags")
    }
    func Fupdate(num:Int){
        flags[num].toggle()
        UserDefaults.standard.set(flags, forKey: "flags")
    }
    func ToggleRF(){
        RecordFlag.toggle()
        UserDefaults.standard.set(RecordFlag, forKey: "RecordFlag")
    }
    
    func ProjectReset(){
        UserDefaults.standard.removeObject(forKey: "FinalGoal")
        self.FinalGoal = ""
        UserDefaults.standard.removeObject(forKey: "Subgoals")
        self.Subgoals = []
        UserDefaults.standard.removeObject(forKey: "flags")
        self.flags = []
        UserDefaults.standard.removeObject(forKey: "AlertFlags")
        self.AlertFlags = []
        UserDefaults.standard.removeObject(forKey: "RecordFlag")
        self.RecordFlag = false
    }
    
    
    init() {
        FinalGoal = UserDefaults.standard.string(forKey: "FinalGoal") ?? ""
        
        Subgoals = UserDefaults.standard.array(forKey: "Subgoals") as? [String] ?? []
        
        flags = UserDefaults.standard.array(forKey: "flags") as? Array<Bool> ?? []
        
        AlertFlags = UserDefaults.standard.array(forKey: "AlertFlags") as? Array<Bool> ?? []
        
        Date = UserDefaults.standard.object(forKey: "Date") as? Date ?? Foundation.Date()
        
        RecordFlag = UserDefaults.standard.bool(forKey: "RecordFlag")
    }
}

class UserData: ObservableObject {
    @Published var RecordFinal : [String]
    @Published var RecordSub : [[String]]
    @Published var RecordDate : [Date]
    @Published var StackFlag : Bool{
        didSet{
            UserDefaults.standard.set(StackFlag, forKey: "StackFlag")
        }
    }
    @Published var SlideFlags : [Bool]{
        didSet{
            UserDefaults.standard.set(SlideFlags, forKey: "SlideFlags")
        }
    }
    
    
    func RecordData(Final:String,Sub:[String],Dat:Date){
        self.RecordFinal.append(Final)
        UserDefaults.standard.set(RecordFinal, forKey: "RecordFinal")
        
        self.RecordSub.append(Sub)
        UserDefaults.standard.set(RecordSub, forKey: "RecordSub")
        
        self.RecordDate.append(Dat)
        UserDefaults.standard.set(RecordDate, forKey: "RecordDate")
        
        self.SlideFlags.append(false)
    }
    
    func Delete_Project(num:Int){
        self.RecordFinal.remove(at: num)
        self.RecordSub.remove(at: num)
        self.RecordDate.remove(at: num)
        UserDefaults.standard.set(RecordFinal, forKey: "RecordFinal")
        UserDefaults.standard.set(RecordSub, forKey: "RecordSub")
        UserDefaults.standard.set(RecordDate, forKey: "RecordDate")
        
        self.SlideFlags.remove(at: num)
    }
    
    
    init(){
        RecordFinal = UserDefaults.standard.array(forKey: "RecordFinal") as? [String] ?? []
        
        RecordSub = UserDefaults.standard.array(forKey: "RecordSub") as? [[String]] ?? []
        
        RecordDate = UserDefaults.standard.array(forKey: "RecordDate") as? [Date] ?? []
        
        StackFlag = UserDefaults.standard.bool(forKey: "StackFlag")
        
        SlideFlags = UserDefaults.standard.array(forKey: "SlideFlags") as? [Bool] ?? []
    }
}

extension Color: RawRepresentable {

    public init?(rawValue: String) {
        
        guard let data = Data(base64Encoded: rawValue) else{
            self = .black
            return
        }
        
        do{
            let color = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? UIColor ?? .black
            self = Color(color)
        }catch{
            self = .black
        }
        
    }

    public var rawValue: String {
        
        do{
            let data = try NSKeyedArchiver.archivedData(withRootObject: UIColor(self), requiringSecureCoding: false) as Data
            return data.base64EncodedString()
            
        }catch{
            
            return ""
            
        }
        
    }

}

