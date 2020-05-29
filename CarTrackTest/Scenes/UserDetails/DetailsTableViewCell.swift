//
//  DetailsTableViewCell.swift
//  CarTrackTest
//
//  Created by Evan Beh on 29/05/2020.
//  Copyright © 2020 Evan Beh. All rights reserved.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle1: UILabel!
    @IBOutlet weak var lblTitle2: UILabel!
    @IBOutlet weak var ibProfileContentView: UIView!
    @IBOutlet weak var ibProfileView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
