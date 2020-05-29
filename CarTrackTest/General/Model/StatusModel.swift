//
//  StatusModel.swift
//  CarTrackTest
//
//  Created by Evan Beh on 28/05/2020.
//  Copyright © 2020 Evan Beh. All rights reserved.
//

import UIKit

class StatusModel {
    
            var isSuccess: Bool!
            var title: String?
            var code: String?
            var description: String

    init(title: String?, description: String?, code: String?, isSuccess:Bool) {
             self.title = title ?? ""
             self.description = description ?? ""
             self.code = code ?? ""
             self.isSuccess = isSuccess
         }
}
