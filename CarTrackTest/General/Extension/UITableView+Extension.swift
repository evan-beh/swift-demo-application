//
//  UITableView+Extension.swift
//  CarTrackTest
//
//  Created by Evan Beh on 29/05/2020.
//  Copyright © 2020 Evan Beh. All rights reserved.
//

import UIKit

private var footerKey: UInt8 = 0

class RefreshView: NSObject{
    
    let spinner = UIActivityIndicatorView(style: .gray)
    let action: () -> Void
    var isRefreshing = false

    public init(action: @escaping () -> Void) {
          self.action = action
      }
}

extension UITableView {


    
    public func setTableViewFooter(completion: @escaping () -> Void) {
        let  refreshView = RefreshView.init(action: completion)
        footerView = refreshView
        self.tableFooterView = refreshView.spinner
    }
    

    private var footerView: RefreshView? {
         get {
             return objc_getAssociatedObject(self, &footerKey) as? RefreshView
         }
         set {
             objc_setAssociatedObject(self, &footerKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
         }
     }
    
   func startRefreshing()
   {
         self.tableFooterView?.isHidden = false
        footerView?.spinner.startAnimating()
    }
    func stopRefreshing()
    {
        self.tableFooterView?.isHidden = true
        self.footerView?.isRefreshing = false
        footerView?.spinner.stopAnimating()

    }
    
    func triggerFooterAction()
    {
        
        //prevent multiple loading
        if(self.footerView!.isRefreshing){return}
        
        self.startRefreshing()
        self.footerView?.isRefreshing = true

        //set delay to show footer loading
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.footerView?.action()
        }
    }

}
