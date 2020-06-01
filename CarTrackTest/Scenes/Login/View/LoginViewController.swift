//
//  LoginViewController.swift
//  CarTrackTest
//
//  Created by Evan Beh on 27/05/2020.
//  Copyright © 2020 Evan Beh. All rights reserved.
//

import UIKit
import ADCountryPicker

class LoginViewController: BaseViewController {
 
  
    @IBOutlet weak var tableView: UITableView!
  
    let viewModel = LoginViewModel()
    var router = MainPageRouter()
    let picker = ADCountryPicker()
    
    @IBOutlet weak var btnLoginClicked: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        viewModel.fetchCellData()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    func configureView ()
    {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.setupPicker()
        self.btnLoginClicked.addAction(for: .touchUpInside)
        { [weak self] btn in
            self?.view.endEditing(true)
            self?.resignFirstResponder()
            self?.viewModel.validateUserLoginEntry(completionHandler: {[weak self] (status) in
                if (status.isSuccess)
                {
                    guard let strongSelf = self else { return }
                                 
                    strongSelf.viewModel.checkUserCredential { (success) in
                                       
                        if (success)
                        {
                            strongSelf.router.perform(.home, from: strongSelf)

                        }
                        else{
                            self?.showAlert(message: "Invalid Username or Password")

                        }

                    }

                    //proceed next screen
                    
                }
                else{
                    self?.showAlert(message: status.description)
                }
            })
        }
    }

}

    

    
extension LoginViewController: UITableViewDelegate, UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return viewModel.items.count
   
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        let cellModel = viewModel.items[indexPath.row]
        
        if (cellModel.type == UserFieldType.UserFieldTypeUserName ||
            cellModel.type == UserFieldType.UserFieldTypePassword )
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1") as! LoginTableViewCell
            
            cell.setModel(object: cellModel)
            
            return cell
            
        }
        else if (cellModel.type == UserFieldType.UserFieldTypeCountry)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as! LoginTableViewCell
            
            cell.setModel(object: cellModel)

            cell.btnOne.setTitle("Select Country", for: .normal)
            cell.btnOne.addAction(for: .touchUpInside) { (button) in
                
                let picker = ADCountryPicker()
                let pickerNavigationController = UINavigationController(rootViewController: picker)
                self.present(pickerNavigationController, animated: true, completion: nil)
                picker.didSelectCountryClosure = { name, code in
                    cell.btnOne.setTitle(name, for: .normal)
                 self.dismiss(animated: true, completion: nil)
                }

            }
            return cell
            
        }
        else {
           
            let cell = UITableViewCell()
            
            return cell
            
        }
     
    }
}

// MARK: SETUP PICKER VIEW

extension LoginViewController {
    
    func setupPicker ()
    {
          
        self.picker.showCallingCodes = true

        self.picker.showFlags = true
            
        self.picker.pickerTitle = "Select a Country"
            
        self.picker.defaultCountryCode = "US"

        self.picker.forceDefaultCountryCode = false

       self.picker.alphabetScrollBarTintColor = UIColor.black
            
       self.picker.alphabetScrollBarBackgroundColor = UIColor.clear
            
        self.picker.closeButtonTintColor = UIColor.black
            
        self.picker.font = UIFont(name: "Helvetica Neue", size: 15)
            
        self.picker.flagHeight = 40
            
        self.picker.hidesNavigationBarWhenPresentingSearch = true
            
        self.picker.searchBarBackgroundColor = UIColor.lightGray
    }
   
}

    
  


