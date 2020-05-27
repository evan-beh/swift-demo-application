//
//  LoginViewModel.swift
//  CarTrackTest
//
//  Created by Evan Beh on 27/05/2020.
//  Copyright © 2020 Evan Beh. All rights reserved.
//

import UIKit

class LoginViewModel: NSObject {

    var arrDatas = [KeyValueModel]()

    func populateCellData()
     {
         let model1 = KeyValueModel()
         model1.key = "cell1"
         model1.value = ""
         model1.title = "Username"
         model1.type = CellType.CellTypeTxtField

        let model2 = KeyValueModel()
        model2.key = "cell2"
        model2.value = ""
        model2.title = "Country"
        model2.type = CellType.CellTypeSelection

         arrDatas.append(model1)
         arrDatas.append(model2)

    }
}
