//
//  BowlerTableViewCell.swift
//  IPLBuzz
//
//  Created by Candidate on 01/04/19.
//  Copyright © 2019 Candidate. All rights reserved.
//

import UIKit

class BowlerTableViewCell: UITableViewCell {

    @IBOutlet weak var bowlerLbl: UILabel!
    
    @IBOutlet weak var economyLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
