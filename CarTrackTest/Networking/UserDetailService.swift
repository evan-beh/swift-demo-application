//
//  UserDetailService.swift
//  CarTrackTest
//
//  Created by Evan Beh on 28/05/2020.
//  Copyright © 2020 Evan Beh. All rights reserved.
//

import UIKit
import Alamofire



class UserDetailService: NSObject {


    public func requestFromServerUserDetails(completionHandler: @escaping(([UserModel]?, _ status:Bool) -> Void))
    {
    
        
        AF.request(Constants.API.userApiURL, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
            debugPrint(responseData)

            
                   guard let data = responseData.data else {
                    
                    completionHandler (nil, true)

                       return
                    
            }
                   do {
                    
                   let users = try JSONDecoder().decode([UserModel].self, from: data)
                       completionHandler(users, true)
                   } catch {
                    
                    
                    completionHandler(nil, false)
                   }
                   
               }
        
    
    }
}
