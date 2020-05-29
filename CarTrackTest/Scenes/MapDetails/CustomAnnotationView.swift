//
//  CustomAnnotationView.swift
//  CarTrackTest
//
//  Created by Evan Beh on 29/05/2020.
//  Copyright © 2020 Evan Beh. All rights reserved.
//

import UIKit
import MapKit


import Foundation
import MapKit

class CustomMarkerView: MKMarkerAnnotationView {

  override var annotation: MKAnnotation? {
    willSet {
      guard let station = newValue as? CustomAnnotation else { return }
      canShowCallout = true
      calloutOffset = CGPoint(x: -8, y: 8)
      rightCalloutAccessoryView = UIButton(type: .detailDisclosure)

        if let imageName = station.imageName {
          glyphImage = UIImage(named: imageName)
        } else {
          glyphImage = nil
      }
    }
  }

}

class CustomAnnotationView: MKAnnotationView {

  override var annotation: MKAnnotation? {
    willSet {
      guard let user = newValue as? CustomAnnotation else {return}

      canShowCallout = true
      calloutOffset = CGPoint(x: -5, y: 5)
      let mapsButton = UIButton(frame: CGRect(origin: CGPoint.zero,
        size: CGSize(width: 30, height: 30)))
      rightCalloutAccessoryView = mapsButton

              image = UIImage(named: "user")


      let detailLabel = UILabel()
      detailLabel.numberOfLines = 0
      detailLabel.font = detailLabel.font.withSize(13)
      detailLabel.text = user.subtitle
      detailCalloutAccessoryView = detailLabel
    }
  }

}

