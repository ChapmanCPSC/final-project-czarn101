//
//  TableViewCell.swift
//  FIFA
//
//  Created by Albert Pierce on 5/12/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import UIKit
import Foundation

class TableViewCell: UITableViewCell {

    @IBOutlet weak var HomeTeamLbl: UILabel!
    @IBOutlet weak var AwayTeamLbl: UILabel!
    @IBOutlet weak var homeScoreLbl: UILabel!
    @IBOutlet weak var awayScoreLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

   
}
