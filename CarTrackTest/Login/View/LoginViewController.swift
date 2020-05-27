//
//  LoginViewController.swift
//  CarTrackTest
//
//  Created by Evan Beh on 27/05/2020.
//  Copyright © 2020 Evan Beh. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController{
  
    @IBOutlet weak var tableView: UITableView!
  
    
    let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        viewModel.populateCellData()

        // Do any additional setup after loading the view.
    }

    
      @IBAction func btnLoginClicked(_ sender: Any) {
        
        self.view.endEditing(true)
        NSLog("%@", viewModel.arrDatas[0])
      }
    
    
        
}
   
// MARK: HANDLING OF TABLE VIEW
extension LoginViewController:  UITableViewDelegate, UITableViewDataSource
{
     
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.arrDatas.count
        
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
            let model = viewModel.arrDatas[indexPath.row]
            
            let cell = dequeueCellForType(cellIdentifier: model.key)

            cell.model = model
            
            return cell
    }
    
    func dequeueCellForType(cellIdentifier:String) -> GeneralTableViewCell
    {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? GeneralTableViewCell {
            
            cell.txtField?.delegate = cell
             return cell
                 
        } else {
                   
            tableView.register(GeneralTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! GeneralTableViewCell
            cell.txtField?.delegate = cell
             return cell
                    
        }
    }

    
}

    
  


