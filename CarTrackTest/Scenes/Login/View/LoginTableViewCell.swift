//
//  LoginTableViewCell.swift
//  CarTrackTest
//
//  Created by Evan Beh on 27/05/2020.
//  Copyright © 2020 Evan Beh. All rights reserved.
//

import UIKit


enum LayoutType {
    case LayoutTypeNormal
    case LayoutTypeHighlight
    case LayoutTypeError
}

class LoginTableViewCell: UITableViewCell , UITextFieldDelegate{

    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var txtField: UITextField!
    
    @IBOutlet weak var btnOne: UIButton!
    
    @IBOutlet weak var ibPadding: UIView!

    var model:LoginCellVM? = LoginCellVM()
    
    override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
            
    //        var observer:NSKeyValueObservation?
    //        // then assign the return value of "observe" to it
    //        observer = btnOne.observe(\.titleLabel, changeHandler: { (label, change) in
    //            // text has changed,
    //        })
            
            setLayoutType(layoutType: LayoutType.LayoutTypeNormal)
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }
    
    func setModel(object:LoginCellVM)
    {
        self.model = object
        lblTitle.text = self.model?.title
        txtField?.delegate = self
                   
        self.txtField?.isSecureTextEntry = object.type == UserFieldType.UserFieldTypePassword
    }
      
    
    func textFieldDidBeginEditing(_ textField: UITextField) {

            setLayoutType(layoutType: LayoutType.LayoutTypeHighlight)
        }

    func textFieldDidEndEditing(_ textField: UITextField) {
           
            self.model?.value = textField.text ?? ""

            setLayoutType(layoutType: LayoutType.LayoutTypeNormal)

        }
        
        
        func setLayoutType(layoutType:LayoutType)
        {
            switch layoutType {
            case .LayoutTypeHighlight:
                ibPadding?.backgroundColor = .green
                break
            case .LayoutTypeError:
                ibPadding?.backgroundColor = .red
                break
            default:
                ibPadding?.backgroundColor = .black
                break
                
            }
            
        }
        

}

