//
//  DataModels.swift
//  IPLBuzz
//
//  Created by Candidate on 01/04/19.
//  Copyright © 2019 Candidate. All rights reserved.
//

import UIKit

struct BattingOrderList {
    var obj: [BattingOrder]
}

struct BattingOrder {
    let name: String
    var runs : Int = 0
    var outOnBall : Float?
    var bowledBy: String?
    var caughtby: String?
    var dismissed: Bool = false
    var batted: Bool = false
}

struct BowlingOrder{
    let name: String
    var runs : Int? = 0
    var wickets : Int? = 0
}

struct Player{
    let name: String
    let image: String!
    
    init(name: String) {
        self.name = name
        var a = name.lowercased()
        a = String(a.filter { !" ".contains($0) })
        self.image = "http://www.hyd.office.juno.com/~sghosh/ipl/images/\(a).jpeg"
        print(self.image)
    }
}

class DataModels: NSObject {
    
    
    func getTeamABattingOrder() -> [BattingOrder] {
        var teamABattingOrder : [BattingOrder] = []
        let obj = BattingOrder(name: "Chris Gayle", runs: 35, outOnBall: 10.3, bowledBy: "Cutting", caughtby: "Bipul Sharma", dismissed: true, batted: true)
        teamABattingOrder.append(obj)
        let obj1 = BattingOrder(name: "Virat Kohli", runs: 44, outOnBall: 12.5, bowledBy: "BB Saran", caughtby: "", dismissed: true, batted: true)
        teamABattingOrder.append(obj1)
        return teamABattingOrder
        
    }

    func getTeamABowlingOrder() -> [BowlingOrder]{
        var bowlingOrderList : [BowlingOrder] = []
        let obj = BowlingOrder(name: "S Aravind", runs: 29, wickets: 2)
        bowlingOrderList.append(obj)
        let obj1 = BowlingOrder(name: "Iqbal Abdullah", runs: 44, wickets: 4)
        bowlingOrderList.append(obj1)
        return bowlingOrderList
    }
    
    func getPlayerForTeamA() -> [Player] {
        var team : [Player] = []
        team.append(Player(name: "Virat Kohli"))
        team.append(Player(name: "Chris Gayle"))
        team.append(Player(name: "Virat Kohli"))
        team.append(Player(name: "Virat Kohli"))
        
        return team
    }
    
    
    
    
    func getTeamBBattingOrder() -> [BattingOrder] {
        var teamABattingOrder : [BattingOrder] = []
        let obj = BattingOrder(name: "David Warner", runs: 35, outOnBall: 10.3, bowledBy: "Cutting", caughtby: "Bipul Sharma", dismissed: true, batted: true)
        teamABattingOrder.append(obj)
        let obj1 = BattingOrder(name: "Kane Williamson", runs: 44, outOnBall: 12.5, bowledBy: "BB Saran", caughtby: "", dismissed: true, batted: true)
        teamABattingOrder.append(obj1)
        return teamABattingOrder
        
    }
    
    func getTeamBBowlingOrder() -> [BowlingOrder]{
        var bowlingOrderList : [BowlingOrder] = []
        let obj = BowlingOrder(name: "Rashid Khan", runs: 29, wickets: 2)
        bowlingOrderList.append(obj)
        let obj1 = BowlingOrder(name: "Bhubaneswar Kumar", runs: 44, wickets: 4)
        bowlingOrderList.append(obj1)
        return bowlingOrderList
    }
    
    func getPlayerForTeamB() -> [Player] {
        var team : [Player] = []
        team.append(Player(name: "DA Warner"))
        team.append(Player(name: "S Dhawan"))
        team.append(Player(name: "MC Henriques"))
        team.append(Player(name: "S Aravind"))
        
        return team
    }
    
}
