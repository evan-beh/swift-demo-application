//
//  UserModel.swift
//  CarTrackTest
//
//  Created by Evan Beh on 27/05/2020.
//  Copyright © 2020 Evan Beh. All rights reserved.
//

import UIKit

class UserModel: Decodable {
  
    var cID :Int?
    var name :String?
    var username :String?
    var email :String?
    var address :Address?
    var phone :String?
    var website :String?
    var company :Company?

    
    private enum CodingKeys: String, CodingKey {
        
        case cID = "id"
        case name
        case username
        case email
        case address
        case phone
        case website
        
        case company
    }

}

class Address: Decodable {
  
    var street :String?
    var suite :String?
    var city :String?
    var zipcode :String?
    var geo :Geo?
  

}


class Geo: Decodable {
  
    var lat :String?
    var lng :String?

  

}


class Company: Decodable {
  
    var name :String?
    var catchPhrase :String?
    var bs :String?

  

}
