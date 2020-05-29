//
//  MasterViewController.swift
//  CarTrackTest
//
//  Created by Evan Beh on 29/05/2020.
//  Copyright © 2020 Evan Beh. All rights reserved.
//

import UIKit


class MasterViewController: UITableViewController {

    var objects = [Any]()
    let service = UserDetailService()
    var router = MainPageRouter()

    override func viewDidLoad() {
        super.viewDidLoad()

        retreiveData();
        self.title = ""
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Login", style: .plain, target: self, action: #selector(showLogin))

    }
    
    
    func retreiveData()
    {
        service.requestFromServerUserDetails { (array, success) in
         
            if (success)
            {
                self.objects = array!
                self.tableView.reloadData()
                
            }
        }
    }
    
    
    @objc func showLogin()
    {
        router.perform(.login, from: self)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row] as! UserModel
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
                controller.title = object.name
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! ListingTableViewCell
        let object = objects[indexPath.row] as! UserModel
        cell.object = object
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
      {
        router.perform(.userDetails, from: self)

      }
}

