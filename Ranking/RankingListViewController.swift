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

class RankingListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var index: String = ""
    var mark: Double = 0.0
    var group: String = ""
    var lecturePoints: Int = 0
    var homeworkPoints: Int = 0
    var presenceCounter: Int = 0
    var absenceCounter: Int = 0
    var allPoints: Int = 0

    var studentArray:[(
    index:String,
    mark:Double,
    group:String,
    lecturePoints:Int,
    homeworkPoints:Int,
    presenceCounter:Int,
    absenceCounter:Int,
    allPoints:Int)] = []

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "LabelCell")
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
                    self.studentArray.append((
                        index: student.index,
                        mark: student.mark,
                        group: student.group,
                        lecturePoints: student.lecturePoints,
                        homeworkPoints: student.homeworkPoints,
                        presenceCounter: student.presenceCounter,
                        absenceCounter: student.absenceCounter,
                        allPoints: student.absenceCounter
                    ))
                }
                
                DispatchQueue.main.async {
                                    self.tableView.reloadData()
                                }
                
            }catch let jsonErr{
                print(jsonErr)
            }
        }.resume()
    
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         studentArray.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
         tableView.rowHeight = 93
         let index = studentArray[indexPath.row].index
         let mark = studentArray[indexPath.row].mark
         let absenceCounter = studentArray[indexPath.row].absenceCounter
         print(studentArray.count)
         cell.textLabel!.numberOfLines = 3
         cell.textLabel!.text = "\(index),\(mark),\(absenceCounter)"


         return cell
     }
     
}
