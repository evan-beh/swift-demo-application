//
//  CarTrackTestTests.swift
//  CarTrackTestTests
//
//  Created by Evan Beh on 27/05/2020.
//  Copyright © 2020 Evan Beh. All rights reserved.
//

import XCTest
@testable import CarTrackTest

class CarTrackTestTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testSuccessLogin()
    {
        
        let vm = LoginViewModel()
        
        vm.fetchCellData()
        
        
        for model in vm.items
        {
            if (model.type == UserFieldType.UserFieldTypeUserName)
            {
                model.value = "helloworld"
            }
            else if (model.type == UserFieldType.UserFieldTypePassword)
            {
                model.value = "123456"

            }
        }
        vm.checkUserCredential { (success) in
            
            XCTAssertEqual(success, true)

        }

    }
    
    func testFailLogin()
    {
        
        let vm = LoginViewModel()
        
        vm.fetchCellData()
        
        
        for model in vm.items
        {
            if (model.type == UserFieldType.UserFieldTypeUserName)
            {
                model.value = "helloworld111"
            }
            else if (model.type == UserFieldType.UserFieldTypePassword)
            {
                model.value = "111"

            }
        }
        vm.checkUserCredential { (success) in
            
            XCTAssertEqual(success, false)

        }

    }

}
