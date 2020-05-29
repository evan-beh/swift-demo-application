//
//  MapDetailViewController.swift
//  CarTrackTest
//
//  Created by Evan Beh on 29/05/2020.
//  Copyright © 2020 Evan Beh. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapDetailViewController: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate {

    @IBOutlet weak var ibMapView: MKMapView!
      private var locationManager: CLLocationManager!

    var detailItem: UserModel? {
           didSet {
           
           }
       }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupGPS()
        setupMap()
        // Do any additional setup after loading the view.
    }
    
    
    func setupGPS()
      {
          
          locationManager = CLLocationManager()
          locationManager.delegate = self
          locationManager.desiredAccuracy = kCLLocationAccuracyBest

          if CLLocationManager.locationServicesEnabled() {
          locationManager.requestWhenInUseAuthorization()
          locationManager.startUpdatingLocation()
                
          }
      }
    
    func setupMap()
    {
        self.ibMapView.register(CustomAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        if let lat = detailItem?.address?.geo?.lat, let lng = detailItem?.address?.geo?.lng
        {
        
            var location:CLLocationCoordinate2D! //location object

            location = CLLocationCoordinate2D(latitude:lat.toDouble() ?? 0.0, longitude: lng.toDouble() ?? 0.0)

          //  location = CLLocationCoordinate2D(latitude:3.1420962, longitude:101.6232076)


            let annotation  = CustomAnnotation.initUserCompany(title: detailItem?.name ?? "-", address: detailItem?.address?.street ?? "", companyName: detailItem?.company?.name ?? "", coordinate:
                location)
            
            self.ibMapView.addAnnotations([annotation])

            let span = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
            let region = MKCoordinateRegion(center: location, span: span)
            self.ibMapView.setRegion(region, animated: true)

        }

        ibMapView.delegate = self
     
     
    

    }
    
}
