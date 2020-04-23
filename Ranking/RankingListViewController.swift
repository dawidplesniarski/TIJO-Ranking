//
//  RankingListViewController.swift
//  Ranking
//
//  Created by Dawid on 23/04/2020.
//  Copyright © 2020 Dawid. All rights reserved.
//

import UIKit



struct StudentData: Codable {
let index: String
let mark: Double
let group: String
let lecturePoints: Int
let homeworkPoints: Int
let presenceCounter: Int
let absenceCounter: Int
let allPoints: Int

}

class RankingListViewController: UIViewController {
    
    var index: String = ""
    var mark: Double = 0.0
    var group: String = ""
    var lecturePoints: Int = 0
    var homeworkPoints: Int = 0
    var presenceCounter: Int = 0
    var absenceCounter: Int = 0
    var allPoints: Int = 0

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadJsonData()
        // Do any additional setup after loading the view.
    }
    
    func loadJsonData(){
        let jsonUrlString = "http://tomaszgadek.com/api/students"
        guard let url = URL(string: jsonUrlString) else { return }
        
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            do{
                let studentObj:[StudentData] = try JSONDecoder().decode([StudentData].self, from: data)
                
                for student in studentObj{
                    print(student)
                }

                
            }catch let jsonErr{
                print(jsonErr)
            }
        }.resume()
    
}
//    self.forecastArray.append((
//    temp: weatherCounter.main.temp,
//    icon: weatherCounterNested.icon,
//    description: weatherCounterNested.main

}
