//
//  ViewController.swift
//  Ranking
//
//  Created by Dawid on 23/04/2020.
//  Copyright © 2020 Dawid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var checkMarks: UIButton!
    @IBOutlet weak var chooseIndex: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkMarks.layer.cornerRadius = 15
        checkMarks.clipsToBounds = true
        chooseIndex.layer.cornerRadius = 15
        chooseIndex.clipsToBounds = true
    }


}

