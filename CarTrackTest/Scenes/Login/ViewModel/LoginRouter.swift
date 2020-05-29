//
//  LoginRouter.swift
//  CarTrackTest
//
//  Created by Evan Beh on 28/05/2020.
//  Copyright © 2020 Evan Beh. All rights reserved.
//

import UIKit

enum LoginSegue {
    case login
    case signUp
    case testNewPage

}


protocol LoginRouter {
    func perform(_ segue: LoginSegue, from source: LoginViewController)
}

class MainLoginRouter: LoginRouter {
    
    func perform(_ segue: LoginSegue, from source: LoginViewController) {
               
        switch segue {
        
        case .login:
            
            source.performSegue(withIdentifier: "routeToListing", sender: source)
    
            break
        case .signUp:
            source.performSegue(withIdentifier: "routeToListing", sender: source)
            break
        case .testNewPage:
            source.performSegue(withIdentifier: "routeToListing", sender: source)
            break

        }

    }

}
