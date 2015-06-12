//
//  StringExtensions.swift
//  THLicense
//
//  Created by Hannes Tribus on 11/06/15.
//  Copyright (c) 2015 3Bus. All rights reserved.
//

import Foundation
import CommonCrypto

extension String {
    
    // MARK: - Hashing
    
    public var MD2: String {
        return String(digestData: hashData.MD2, length: Int(CC_MD2_DIGEST_LENGTH))
    }
    
    public var MD4: String {
        return String(digestData: hashData.MD4, length: Int(CC_MD4_DIGEST_LENGTH))
    }
    
    public var MD5: String {
        return String(digestData: hashData.MD5, length: Int(CC_MD5_DIGEST_LENGTH))
    }
    
    public var SHA1: String {
        return String(digestData: hashData.SHA1, length: Int(CC_SHA1_DIGEST_LENGTH))
    }
    
    public var SHA224: String {
        return String(digestData: hashData.SHA224, length: Int(CC_SHA224_DIGEST_LENGTH))
    }
    
    public var SHA256: String {
        return String(digestData: hashData.SHA256, length: Int(CC_SHA256_DIGEST_LENGTH))
    }
    
    public var SHA384: String {
        return String(digestData: hashData.SHA384, length: Int(CC_SHA384_DIGEST_LENGTH))
    }
    
    public var SHA512: String {
        return String(digestData: hashData.SHA512, length: Int(CC_SHA512_DIGEST_LENGTH))
    }
    
    // MARK: - Private
    
    private var hashData: NSData {
        let cstr = cStringUsingEncoding(NSUTF8StringEncoding)
        return NSData(bytes: cstr!, length: count(self))
    }
    
    private init(digestData: NSData, length: Int) {
        var digest = [UInt8](count:Int(CC_SHA1_DIGEST_LENGTH), repeatedValue: 0)
        CC_SHA1(digestData.bytes, CC_LONG(digestData.length), &digest)
        let hexBytes = map(digest) { String(format: "%02hhx", $0) }
        self.init("".join(hexBytes))
    }
}