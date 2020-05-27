//
//  GeneralTableViewCell.swift
//  CarTrackTest
//
//  Created by Evan Beh on 27/05/2020.
//  Copyright © 2020 Evan Beh. All rights reserved.
//

import UIKit



class GeneralTableViewCell: UITableViewCell , UITextFieldDelegate{

    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var txtField: UITextField!
    
    @IBOutlet weak var btnOne: UIButton!
    var model:KeyValueModel? = KeyValueModel()
    
    var cellType:CellType!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension GeneralTableViewCell
{
    
     func textFieldDidEndEditing(_ textField: UITextField)
    {

        model?.value = textField.text ?? ""
    }

}

