//
//  THLicense.swift
//  THLicense
//
//  Created by Hannes Tribus on 11/06/15.
//  Copyright (c) 2015 3Bus. All rights reserved.
//

import Foundation

public class THLicense: NSObject {
    
    public var debugMode:Bool = false
    
    private lazy var licenseKey = String()
    private lazy var salt = String()
    
    // Singleton
    public static let sharedLicense : THLicense = THLicense()
    
    private override init() {
        println(__FUNCTION__)
        super.init()
    }
    
    public func setLicenseKey(licenseKey : String) {
        self.licenseKey = licenseKey
    }
    
    public func setSalt(salt : String) {
        self.salt = salt
    }
    
    public func isLicenseValid() -> Bool {
        if (debugMode) {
            println("Licensekey \(licenseKey)")
        }
        if let bundleId = NSBundle(forClass: self.dynamicType).bundleIdentifier {
            if (hashKey(bundleId) == licenseKey) {
                return true
            }
            var bundleIdArray = split(bundleId) {$0 == "."}
            if (bundleIdArray.count > 2) {
                if (hashKey("\(bundleIdArray[0]).\(bundleIdArray[1])") == licenseKey) {
                    return true
                }
            }
        }
        return false
    }
    
    private func hashKey(key : String) -> String {
        let validkey = String("\(key)_\(salt)").SHA1
        if (debugMode) {
            println("Valid key for \(key) would be \(validkey)")
        }
        return validkey
    }
}