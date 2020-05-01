//
//  ViewController.swift
//  Ranking
//
//  Created by Dawid on 23/04/2020.
//  Copyright © 2020 Dawid. All rights reserved.
//

import UIKit

struct Index: Codable {
let index: String
}

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    
    @IBOutlet weak var checkMarks: UIButton!
    @IBOutlet weak var chooseIndex: UIButton!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var albumNumbers: [String] = []
    var indexNumber:String = "30785"
    
    @IBAction func showDetails(_ sender: Any) {
        self.performSegue(withIdentifier: "mainToDetail", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        checkMarks.layer.cornerRadius = 15
        checkMarks.clipsToBounds = true
        chooseIndex.layer.cornerRadius = 15
        chooseIndex.clipsToBounds = true
        let color = UIColor(named:"Color")
        let color1 = UIColor(named: "Color-1")
        checkMarks.applyGradient(colours: [color!, color1!])
        chooseIndex.applyGradient(colours: [color!, color1!])
        pickerView.setValue(UIColor.white, forKeyPath: "textColor")
        pickerView.layer.cornerRadius = 15
        pickerView.clipsToBounds = true
        loadAlbums()
    }
    
    
        
    func loadAlbums(){
        let jsonUrlString = "http://tomaszgadek.com/api/students"
        guard let url = URL(string: jsonUrlString) else { return }
        
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            do{
                let index:[Index] = try JSONDecoder().decode([Index].self, from: data)
                
                for i in index{
                    self.albumNumbers.append(i.index)
                }
                DispatchQueue.main.async {
                    self.pickerView.reloadAllComponents()
                }
                
                
            }catch let jsonErr{
                print(jsonErr)
            }
        }.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "mainToDetail"){
            let detailVC = segue.destination as! DetailTableView
            detailVC.index = indexNumber
        }
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        albumNumbers.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return albumNumbers[row]
    }
   func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent  component: Int) {
    indexNumber = albumNumbers[row]
    }


}

extension UIView {
    @discardableResult
    func applyGradient(colours: [UIColor]) -> CAGradientLayer {
        return self.applyGradient(colours: colours, locations: nil)
    }

    @discardableResult
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
        return gradient
    }
}
