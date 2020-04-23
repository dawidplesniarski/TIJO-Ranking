//
//  DataStructure.swift
//  Ranking
//
//  Created by Dawid on 23/04/2020.
//  Copyright © 2020 Dawid. All rights reserved.
//

import Foundation

class DataStructure{

struct StudentData: Codable {
    var index: Int
    var mark: Double
    var group: String
    var lecturePoints: Int
    var homeWorkPoints: Int
    var presenceCounter: Int
    var absenceCounter: Int
    var allPoints: Int
    
    init(albumNo: Int, mark: Double, group: String, lecturePoints:Int, homeWorkPoints: Int, presenceCounter:Int, absenceCounter:Int, allPoints: Int){
        self.index = albumNo
        self.mark = mark
        self.group = group
        self.lecturePoints = lecturePoints
        self.homeWorkPoints = homeWorkPoints
        self.presenceCounter = presenceCounter
        self.absenceCounter = absenceCounter
        self.allPoints = allPoints
    }
    func getIndex() -> Int{
        return index
    }
    func getMark()-> Double{
        return mark
    }
    func getGroup()-> String{
        return group
    }
    func getLecturePoints()-> Int{
        return lecturePoints
    }
    func getHomeWorkPoints()-> Int{
        return homeWorkPoints
    }
    func getPresenceCounter()-> Int{
        return presenceCounter
    }
    func getAbsenceCounter()-> Int{
        return absenceCounter
    }
    func getAllPoints()-> Int{
        return allPoints
    }
    
}

}
