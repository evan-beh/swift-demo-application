//
//  CustomAnnotation.swift
//  CarTrackTest
//
//  Created by Evan Beh on 29/05/2020.
//  Copyright © 2020 Evan Beh. All rights reserved.
//

import Foundation
import MapKit
import Contacts

class CustomAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    
  let title: String?
  let address: String
  let companyName: String


    private init(title: String, address: String, companyName: String, coordinate: CLLocationCoordinate2D) {
    self.title = title
    self.address = address
    self.companyName = companyName
    self.coordinate = coordinate

    super.init()
  }
    
    
    static func initUserCompany(title: String, address: String, companyName: String, coordinate: CLLocationCoordinate2D) -> CustomAnnotation
    {
        let annotation = CustomAnnotation(title: title, address: address, companyName: companyName, coordinate: coordinate)

        return annotation
    }
    

 
  var subtitle: String? {
    return companyName
  }

  var imageName: String? {
    return "avatar"
  }

  // Annotation right callout accessory opens this mapItem in Maps app
  func mapItem() -> MKMapItem {
    let addressDict = [CNPostalAddressStreetKey: subtitle!]
    let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDict)
    let mapItem = MKMapItem(placemark: placemark)
    mapItem.name = title
    return mapItem
  }

}
