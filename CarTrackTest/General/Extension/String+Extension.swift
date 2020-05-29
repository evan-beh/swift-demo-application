//
//  String+Extension.swift
//  CarTrackTest
//
//  Created by Evan Beh on 29/05/2020.
//  Copyright © 2020 Evan Beh. All rights reserved.
//
import UIKit

extension String
{
    public func toDouble() -> Double?
    {
       if let num = NumberFormatter().number(from: self) {
                return num.doubleValue
            } else {
                return nil
            }
     }
}
