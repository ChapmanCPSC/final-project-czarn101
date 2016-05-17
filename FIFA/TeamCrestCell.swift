//
//  TeamCrestCell.swift
//  FIFA
//
//  Created by Albert Pierce on 5/14/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import UIKit

class TeamCrestCell: UITableViewCell {
    
    @IBOutlet weak var teamNameLbl: UILabel!
    @IBOutlet weak var crestImage: UIImageView!
    
    override func awakeFromNib() {
        
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
