//
//  LoginViewModel.swift
//  CarTrackTest
//
//  Created by Evan Beh on 27/05/2020.
//  Copyright © 2020 Evan Beh. All rights reserved.
//

import UIKit

class LoginViewModel: NSObject {

    var items = [KeyValueModel]()

    
    func fetchCellData() {

        items.append(getCellData(forType: UserFieldType.UserFieldTypeUserName))
        items.append(getCellData(forType: UserFieldType.UserFieldTypeCountry))

       }
    
    
   private func getCellData(forType:UserFieldType) -> KeyValueModel
     {
        
        if (forType == UserFieldType.UserFieldTypeUserName)
        {
           let model1 = KeyValueModel()
           model1.key = "cell1"
           model1.value = ""
           model1.title = "Username"
           model1.type = CellType.CellTypeTxtField
            return model1
        }
        else if (forType ==  UserFieldType.UserFieldTypeCountry)
        {
            let model2 = KeyValueModel()
            model2.key = "cell2"
            model2.value = ""
            model2.title = "Country"
            model2.type = CellType.CellTypeSelection

            return model2
            
        }
        else{

            let model3 = KeyValueModel()
            model3.key = "cell3"
            model3.value = ""
            model3.title = "None"
            model3.type = CellType.CellTypeNone

            return model3
        }
    
    }
    
}
