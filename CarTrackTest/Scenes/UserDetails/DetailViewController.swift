//
//  DetailViewController.swift
//  eweeqweqwe
//
//  Created by Evan Beh on 29/05/2020.
//  Copyright © 2020 Evan Beh. All rights reserved.
//

import UIKit


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
    
    @IBOutlet weak var ibTableView: UITableView!
    @IBOutlet weak var detailDescriptionLabel: UILabel!


    
    let array:[DisplayCell] = [ DisplayCell.DisplayCellName,
                                DisplayCell.DisplayCellUserName,
                                DisplayCell.DisplayCellEmail,
                                DisplayCell.DisplayCellAddress,
                                DisplayCell.DisplayCellEmail,
                                DisplayCell.DisplayCellPhone,
                                DisplayCell.DisplayCellWebsite,
                                DisplayCell.DisplayCellCompany,
                                DisplayCell.DisplayCellGeo]
    
    
    func configureView() {
        // Update the user interface for the detail item.
      
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.ibTableView.delegate = self
        self.ibTableView.dataSource = self
        configureView()
    }

    var detailItem: UserModel? {
        didSet {
            // Update the view.
         //   configureView()
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
