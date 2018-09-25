//
//  BandCell.swift
//  Book My Band
//
//  Created by Matt Huston on 9/21/18.
//  Copyright © 2018 Matt Huston. All rights reserved.
//

import UIKit

class BandCell: UITableViewCell {
    
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Id: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
