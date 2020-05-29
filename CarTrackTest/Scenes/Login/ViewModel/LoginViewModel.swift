//
//  LoginViewModel.swift
//  CarTrackTest
//
//  Created by Evan Beh on 27/05/2020.
//  Copyright © 2020 Evan Beh. All rights reserved.
//

import UIKit

class LoginViewModel {


    
    var items = [LoginCellVM]()
    
    
    func fetchCellData() {

        items.append(getCellData(forType: UserFieldType.UserFieldTypeUserName))
        items.append(getCellData(forType: UserFieldType.UserFieldTypePassword))
        items.append(getCellData(forType: UserFieldType.UserFieldTypeCountry))

       }
    
    
   private func getCellData(forType:UserFieldType) -> LoginCellVM
     {
        
        if (forType == UserFieldType.UserFieldTypeUserName)
        {
           let model = LoginCellVM()
           model.key = "cell1"
           model.value = ""
           model.title = "Username"
           model.type = forType
            return model
        }
        else if (forType ==  UserFieldType.UserFieldTypeCountry)
        {
            let model = LoginCellVM()
            model.key = "cell2"
            model.value = ""
            model.title = "Country"
            model.type = forType

            return model
            
        }
        else if (forType ==  UserFieldType.UserFieldTypePassword){

            let model = LoginCellVM()
            model.key = "cell3"
            model.value = ""
            model.title = "Password"
            model.type = forType

            return model
        }
        else{

              let model = LoginCellVM()
              model.key = "cell4"
              model.value = ""
              model.title = "None"
              model.type = forType

              return model
              }
    
    }
    
   
    
}

extension LoginViewModel
{
    enum Const {
        static let username = "apple"
        static let password = "123456"
        static let expiredPassword = "121212"
    }

        
    func validateUserLoginEntry(completionHandler:(StatusModel) -> Void)
       {
        
        var hasError = false
        
           for model in items{
               
               if let fieldType = model.type{
                 //  validateUserField(type: fieldType, parameter: model.value, completionHandler: )
                
                validateUserFieldFor(type: fieldType, parameter: model.value) { (errorMsg) in
                    
                    
                    if (!errorMsg.isEmpty)
                    {
                        completionHandler(StatusModel(title: "", description: errorMsg, code: "", isSuccess: false))
                        hasError = true
                        return

                    }
                  
                }
               }
           }
        
        if (!hasError)
        {
            completionHandler(StatusModel(title: "", description: "", code: "", isSuccess: true))

        }
       }
       
    func validateUserFieldFor(type:UserFieldType, parameter:String, completionHandler:(String)-> Void)
       {
           
           if (type == UserFieldType.UserFieldTypeUserName)
           {
            if (parameter.count == 0)
            {
                completionHandler("Please Enter a Username")
            }
               
           }
           else if (type == UserFieldType.UserFieldTypePassword)
           {
            
            if (parameter.count == 0)
            {
              completionHandler("Please Enter Password")
            }
           }
               
       }
    
}
