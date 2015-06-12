//
//  THLicenseTests.swift
//  THLicenseTests
//
//  Created by Hannes Tribus on 11/06/15.
//  Copyright (c) 2015 3Bus. All rights reserved.
//

import UIKit
import XCTest
import THLicense

class THLicenseTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        THLicense.sharedLicense.debugMode = true
        THLicense.sharedLicense.setSalt("123456")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testWithoutLicense() {
        XCTAssertFalse(THLicense.sharedLicense.isLicenseValid(), "Empty License should be invalid but wasn't")
    }
    
    func testValidAPPLicense() {
        THLicense.sharedLicense.setLicenseKey("db693f13bf2267c510a2e202afcca4067a16d8ed")
        XCTAssertTrue(THLicense.sharedLicense.isLicenseValid(), "License should be valid but wasn't")
        THLicense.sharedLicense.setLicenseKey("invalidLicense")
        XCTAssertFalse(THLicense.sharedLicense.isLicenseValid(), "License should be invalid but wasn't")
    }
    
    func testValidCompanyLicense() {
        THLicense.sharedLicense.setLicenseKey("11863e432c5bc057556ed238dc56271c5c86a167")
        XCTAssertTrue(THLicense.sharedLicense.isLicenseValid(), "License should be valid but wasn't")
        THLicense.sharedLicense.setLicenseKey("invalidLicense")
        XCTAssertFalse(THLicense.sharedLicense.isLicenseValid(), "License should be invalid but wasn't")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
