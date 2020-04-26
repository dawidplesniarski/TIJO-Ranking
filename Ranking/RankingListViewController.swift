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
    var indexForSegue: String = ""

    var studentArray: [StudentData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        loadJsonData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "detailSegue"){
            let detailVC = segue.destination as! DetailTableView
            detailVC.index = indexForSegue
        }
    }
    
    
    func loadJsonData(){
        let jsonUrlString = "http://tomaszgadek.com/api/students"
        guard let url = URL(string: jsonUrlString) else { return }
        
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            do{
                let studentObj:[StudentData] = try JSONDecoder().decode([StudentData].self, from: data)
                
                for student in studentObj{
                    self.studentArray.append(student)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as! TableViewCell
         tableView.rowHeight = 93
        let index = studentArray[indexPath.row].index
        let absenceCounter = studentArray[indexPath.row].absenceCounter
        let mark = studentArray[indexPath.row].mark
        let presence = studentArray[indexPath.row].presenceCounter
        let homeworkPoints = studentArray[indexPath.row].homeworkPoints
        let group = studentArray[indexPath.row].group
        let lecturePoints = studentArray[indexPath.row].lecturePoints
        let allPoints = studentArray[indexPath.row].allPoints
        

        cell.index.text = index
        cell.mark.text = String(mark)
        cell.absence.text = String(absenceCounter)
        cell.presence.text = String(presence)
        cell.homeworkPoints.text = String(homeworkPoints)
        cell.group.text = String(group)
        cell.totalPoints.text = String(allPoints)
        cell.lecturePoints.text = String(lecturePoints)
    
         return cell
     }
//         func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//            let item = studentArray[indexPath.row].index
//             print(item)
//         }
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
{
    let modifyAction = UIContextualAction(style: .normal, title:  "Details of \(self.studentArray[indexPath.row].index)", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            success(true)
        })
        modifyAction.image = UIImage(named: "hammer")
        modifyAction.backgroundColor = .blue
    
    indexForSegue = studentArray[indexPath.row].index
        
        return UISwipeActionsConfiguration(actions: [modifyAction])
    }
    
    func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        self.performSegue(withIdentifier: "detailSegue", sender: nil)
    }

}
