//
//  ListingTableViewCell.swift
//  CarTrackTest
//
//  Created by Evan Beh on 29/05/2020.
//  Copyright © 2020 Evan Beh. All rights reserved.
//

import UIKit

class ListingTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle1: UILabel!
    @IBOutlet weak var lblTitle2: UILabel!
    @IBOutlet weak var ibProfileContentView: UIView!
    @IBOutlet weak var ibProfileView: UIImageView!
    
    @IBOutlet weak var ibContentView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configureView() {
        // Update the user interface for the detail item.
        if let userModel = object {
            if let label1 = lblTitle1 {
                label1.text = userModel.name
            }
            if let label2 = lblTitle2 {
                label2.text = userModel.company?.name
            }
        }
        
        ibProfileView.image = UIImage(imageLiteralResourceName: "avatar").withRenderingMode(.alwaysTemplate)
        ibProfileView.tintColor = UIColor.lightGray


        self.contentView.setCardView()
        
        
//        ibProfileContentView.roundBorders(value: (Float(ibProfileContentView.frame.width)/2), borderColor: UIColor.lightGray)
    }

    
    var object: UserModel? {
          didSet {
              // Update the view.
              configureView()
          }
      }
}
