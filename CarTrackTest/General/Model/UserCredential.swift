//
//  UserCredential.swift
//  CarTrackTest
//
//  Created by Evan Beh on 29/05/2020.
//  Copyright © 2020 Evan Beh. All rights reserved.
//

import UIKit

class UserCredential: NSObject {

      var username :String?
      var password :String?
      var country :String?
    
    
    init(username:String,password:String,country:String) {
        
        self.username = username
        self.password = password
        self.country = country
    }
}
