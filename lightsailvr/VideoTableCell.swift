//
//  VideoTableCell.swift
//  lightsailvr
//
//  Created by Micah Chiang on 2/20/16.
//  Copyright © 2016 Micah Chiang. All rights reserved.
//

import UIKit
import Firebase

class VideoTableCell: UITableViewCell {

    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var videoDesc: UILabel!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
