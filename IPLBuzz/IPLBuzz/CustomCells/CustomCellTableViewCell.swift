//
//  CustomCellTableViewCell.swift
//  IPLBuzz
//
//  Created by Candidate on 01/04/19.
//  Copyright © 2019 Candidate. All rights reserved.
//

import UIKit

class CustomCellTableViewCell: UITableViewCell {

    @IBOutlet weak var playerLbl: UILabel!
    
    @IBOutlet weak var outLbl: UILabel!
    
    @IBOutlet weak var ballLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
