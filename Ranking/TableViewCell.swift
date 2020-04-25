//
//  TableViewCell.swift
//  Ranking
//
//  Created by Dawid on 25/04/2020.
//  Copyright © 2020 Dawid. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var index: UILabel!
    @IBOutlet weak var mark: UILabel!
    @IBOutlet weak var group: UILabel!
    @IBOutlet weak var lecturePoints: UILabel!
    @IBOutlet weak var homeworkPoints: UILabel!
    @IBOutlet weak var totalPoints: UILabel!
    @IBOutlet weak var absence: UILabel!
    
    @IBOutlet weak var presence: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
