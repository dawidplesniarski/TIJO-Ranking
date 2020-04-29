//
//  DetailTableView.swift
//  Ranking
//
//  Created by Dawid on 25/04/2020.
//  Copyright © 2020 Dawid. All rights reserved.
//

import UIKit

struct Details : Codable{
    let index : String
    let group : String
    let labs : [Labs]
}

struct Labs : Codable{
    let dateOfLab : String
    let presence : Bool
    let points : Int
}

class DetailTableView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var groupLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var index: String = ""
    var group: String = ""
    var details : [Labs] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        loadJsonData(index: index)
    }
    
    func loadJsonData(index: String){
        let jsonUrlString = "http://tomaszgadek.com/api/students/\(index)"
        guard let url = URL(string: jsonUrlString) else { return }
        
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            do{
                let details = try JSONDecoder().decode(Details.self, from: data)
                
                self.index = details.index
                self.group = details.group
                
                for detail in details.labs{
                    self.details.append(detail)
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
        details.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! DetailCell
             tableView.rowHeight = 93
        indexLabel.text = "Index: \(index)"
        groupLabel.text = "Grupa: \(group)"
        cell.date.text = "Data: \(details[indexPath.row].dateOfLab)"
        cell.group.text = "Punkty: \(String(details[indexPath.row].points))"
        cell.presenceImage.image = UIImage(named:String(details[indexPath.row].presence))
        
        return cell
    }

}
