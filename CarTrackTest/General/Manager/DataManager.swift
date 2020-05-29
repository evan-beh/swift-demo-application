//
//  DataManager.swift
//  CarTrackTest
//
//  Created by Evan Beh on 29/05/2020.
//  Copyright © 2020 Evan Beh. All rights reserved.
//

import UIKit
import SQLite

class DataManager: NSObject {
     //DB Info
     var db: Connection?

     let tblUser = Table("User")
     let dbUserUsername = Expression<String>("username")
     let dbUserPassword = Expression<String>("password")
     let dbUserCountry = Expression<String>("country")
    
    
    func dbSetup()
       {
           let databaseFileName = "db.sqlite3"
           let databaseFilePath = "\(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])/\(databaseFileName)"
           db = try! Connection(databaseFilePath)

           
           try! db!.run(tblUser.create(ifNotExists: true) { t in
               t.column(dbUserUsername)
               t.column(dbUserPassword)
               t.column(dbUserCountry)
           })
        
       
        
       }
    
    func insertDataToDB(username:String,password:String,country:String)
    {
        
        //inserting data to the sqlite database
            do {
                let rowid = try db!.run(tblUser.insert(or: .replace, dbUserUsername <- username,dbUserPassword <- password, dbUserCountry <- country))
                print("Row inserted successfully id: \(rowid)")
            } catch {
                print("insertion failed: \(error)")
            }
    }
    
    
    func retreiveDataFromDB () ->  [UserCredential]
    {
        
        var array = [UserCredential]()
        do {
                  
              for user in try db!.prepare(tblUser) {
                                     print("username: \(user[dbUserUsername]), password: \(user[dbUserPassword]), country: \(dbUserCountry)")
                
                let model = UserCredential(username: user[dbUserUsername], password: user[dbUserPassword], country: user[dbUserCountry])
                
                array.append(model)
                                
              }
           }
              catch {
                  print("insertion failed: \(error)")

              }
        return array
             
    }
    
    func checkUserCredential (username:String,password:String) -> (Bool)
       {
           
           do {
                     
                 for user in try db!.prepare(tblUser) {
                           
                    print("username: \(user[dbUserUsername]), password: \(user[dbUserPassword]), country: \(dbUserCountry)")
                   
                   
                    if (username == user[dbUserUsername] && password == user[dbUserPassword])
                    {
                        
                        print ("user matched")
                        
                        return true;
                    }
                                   
                 }
              }
                 catch {
                     print("insertion failed: \(error)")
                    return false;

                 }
            
        
        return false
       }
    
    
}
