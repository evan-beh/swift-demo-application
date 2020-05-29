//
//  DetailViewController.swift
//  CarTrackTest
//
//  Created by Evan Beh on 29/05/2020.
//  Copyright © 2020 Evan Beh. All rights reserved.
//

import UIKit
import MapKit



class DetailViewController: UIViewController {

    
    enum DisplayCell
    {
        case DisplayCellName
        case DisplayCellUserName
        case DisplayCellEmail
        case DisplayCellAddress
        case DisplayCellPhone
        case DisplayCellWebsite
        case DisplayCellCompany
        case DisplayCellGeo

    }

    @IBOutlet weak var ibMapView: MKMapView!
    
    @IBOutlet weak var ibTableView: UITableView!
    @IBOutlet weak var detailDescriptionLabel: UILabel!

   var router = MainPageRouter()

    
    let array:[DisplayCell] = [ DisplayCell.DisplayCellName,
                                DisplayCell.DisplayCellUserName,
                                DisplayCell.DisplayCellEmail,
                                DisplayCell.DisplayCellAddress,
                                DisplayCell.DisplayCellEmail,
                                DisplayCell.DisplayCellPhone,
                                DisplayCell.DisplayCellWebsite,
                                DisplayCell.DisplayCellCompany,
    ]
    
    var detailItem: UserModel? {
        didSet {
    
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.ibTableView.delegate = self
        self.ibTableView.dataSource = self
        configureView()

    }

    
    func configureView() {
        // Update the user interface for the detail item.
      
        self.ibTableView.contentInset = UIEdgeInsets(top: 200, left: 0, bottom: 0, right: 0)

       // btnMapClicked.addTarget(self, action: #selector(showMapView), for: .touchUpInside)

        
        let button:UIButton = UIButton(frame: self.view.frame)
        button.backgroundColor = .clear
        button.addTarget(self, action:#selector(showMapView), for: .touchUpInside)
        self.ibTableView.backgroundView = button

        
        
        if let lat = detailItem?.address?.geo?.lat, let lng = detailItem?.address?.geo?.lng
             {
             
                 var location:CLLocationCoordinate2D! //location object

                 location = CLLocationCoordinate2D(latitude:lat.toDouble() ?? 0.0, longitude: lng.toDouble() ?? 0.0)

                 location = CLLocationCoordinate2D(latitude:3.1420962, longitude:101.6232076)


                 let annotation  = CustomAnnotation.initUserCompany(title: detailItem?.name ?? "-", address: detailItem?.address?.street ?? "", companyName: detailItem?.company?.name ?? "", coordinate:
                     location)
                 
                 self.ibMapView.addAnnotations([annotation])

                 let span = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                 let region = MKCoordinateRegion(center: location, span: span)
                 self.ibMapView.setRegion(region, animated: true)

             }
        
    }
    
    @objc func showMapView()
    {
        router.perform(.userMap, from: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if segue.identifier == "showMap" {
              let controller = (segue.destination as! MapDetailViewController)
                               controller.detailItem = detailItem
//                               controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
//                               controller.navigationItem.leftItemsSupplementBackButton = true
                               controller.title = detailItem?.name
          }
      }


}


extension DetailViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! DetailsTableViewCell
        
        let type = array[indexPath.row]
        displayCellForRow(type: type, cell: cell);

        return cell
    }


    
    func displayCellForRow(type:DisplayCell, cell:DetailsTableViewCell)
    {

        switch type {
      
        case .DisplayCellName:
            cell.lblTitle1.text = "Name"
            cell.lblTitle2.text = detailItem?.name

            break
        case .DisplayCellUserName:
            cell.lblTitle1.text = "Username"
            cell.lblTitle2.text = detailItem?.username

            break
        case .DisplayCellEmail:
            cell.lblTitle1.text = "Email"
            cell.lblTitle2.text = detailItem?.email

            break
        case .DisplayCellAddress:
            cell.lblTitle1.text = "Address"
            
            
            
            cell.lblTitle2.text = String(format: "%@, %@,%@", detailItem?.address?.street ?? "-",detailItem?.address?.suite ?? "-",detailItem?.address?.city ?? "-")


            break
        case .DisplayCellPhone:
            cell.lblTitle1.text = "Phone"
            cell.lblTitle2.text = detailItem?.phone

            break
        case .DisplayCellWebsite:
            cell.lblTitle1.text = "Website"
            cell.lblTitle2.text = detailItem?.website

            break
        case .DisplayCellCompany:
            cell.lblTitle1.text = "Company"
            cell.lblTitle2.text = detailItem?.company?.name

            break
            
            case .DisplayCellGeo:
           cell.lblTitle1.text = "Geo Location"
           cell.lblTitle2.text = detailItem?.company?.name

           break

        }
    }
    
    
    
}
