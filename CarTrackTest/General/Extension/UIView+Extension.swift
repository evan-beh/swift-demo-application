//
//  UIView+Extension.swift
//  CarTrackTest
//
//  Created by Evan Beh on 29/05/2020.
//  Copyright © 2020 Evan Beh. All rights reserved.
//

import UIKit

extension UIView{

    
    func roundBorders(value:Float, borderColor:UIColor)
    {
        
        self.layer.cornerRadius = CGFloat(value)
        self.layer.borderWidth = 1
        self.layer.borderColor = borderColor.cgColor
    }
    
    func roundBorders(value:Float, borderColor:UIColor, borderWidth:Float)
      {
          
          self.layer.cornerRadius = CGFloat(value)
        self.layer.borderWidth = CGFloat(borderWidth)
          self.layer.borderColor = borderColor.cgColor
      }
    
    
     func setCardView(){
             layer.cornerRadius = 5.0
             layer.borderColor  =  UIColor.clear.cgColor
             layer.borderWidth = 5.0
             layer.shadowOpacity = 0.5
             layer.shadowColor =  UIColor.lightGray.cgColor
             layer.shadowRadius = 5.0
             layer.shadowOffset = CGSize(width:5, height: 5)
             layer.masksToBounds = true
         }
}
