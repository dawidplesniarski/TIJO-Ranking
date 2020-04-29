//
//  DetailCell.swift
//  Ranking
//
//  Created by Dawid on 25/04/2020.
//  Copyright © 2020 Dawid. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell {

    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var group: UILabel!
    @IBOutlet weak var presenceImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
