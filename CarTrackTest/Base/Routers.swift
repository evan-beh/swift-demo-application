//
//  Routers.swift
//  CarTrackTest
//
//  Created by Evan Beh on 29/05/2020.
//  Copyright © 2020 Evan Beh. All rights reserved.
//

import UIKit



enum LoginSegue {
    case home
    case forgetPassword

}


enum UserDetailSegue {
    case userMap

}



enum MasterSegue {
    case userDetails
    case login

}



protocol Routers {
    func perform(_ segue: MasterSegue, from source: MasterViewController)
    func perform(_ segue: LoginSegue, from source: LoginViewController)
    func perform(_ segue: UserDetailSegue, from source: DetailViewController)

}

 class MainPageRouter: Routers {
    
    func perform(_ segue: MasterSegue, from source: MasterViewController) {
               
        switch segue {
        
        case .login:
            
            let vc = source.storyboard?.instantiateViewController(withIdentifier: "sb_login")
            source.present(vc!, animated: true)
            break

        case .userDetails:
            
            source.performSegue(withIdentifier: "showDetail", sender: source)
            break

        }

    }
    
    func perform(_ segue: LoginSegue, from source: LoginViewController) {
                  
           switch segue {
           
           case .home:
               
               source.navigationController?.dismiss(animated: true, completion: nil)
       
               break

           case .forgetPassword:
               break

           }

       }
    
    func perform(_ segue: UserDetailSegue, from source: DetailViewController) {
          
          switch segue {
          case .userMap:
              source.performSegue(withIdentifier: "showMap", sender: source)

              break

         
          }
       
      }

}

