//
//  NetworkJSONHandlerTestCase.swift
//  Albums
//
//  Created by Himanshu Tantia on 10/13/14.
//  Copyright (c) 2014 Himanshu. All rights reserved.
//

import XCTest

var NetworkJSONHandler_SerializationTestDouble_Data: NSData?

let NetworkJSONHandler_SerializationTestDouble_Error = ErrorTestDouble()

let NetworkJSONHandler_SerializationTestDouble_JSON = NSObject()

var NetworkJSONHandler_SerializationTestDouble_Options: NSJSONReadingOptions?

final class NetwrokJSONHandler_SerializationTestDouble: NSObject, TDD_NetworkJSONHandler_SerialzationType {
    class func JSONObjectWithData(data: NSData!, options: NSJSONReadingOptions, error: NSErrorPointer) -> AnyObject! {
        NetworkJSONHandler_SerializationTestDouble_Data = data
        NetworkJSONHandler_SerializationTestDouble_Options = options
        
        if error != nil {
            error.memory = NetworkJSONHandler_SerializationTestDouble_Error
        }
        
        return NetworkJSONHandler_SerializationTestDouble_JSON
    }
}

class NetworkJSONHandlerTestCase: XCTestCase {
    var error: NSError?
    let response = TDD_NetworkResponse()
}

extension NetworkJSONHandlerTestCase {
    
    func testClass() {
        XCTAssertTrue(TDD_NetworkJSONHandler.serializationClass() === NSJSONSerialization.self)
    }
}

extension NetworkJSONHandlerTestCase {
    
    func testResponseError() {
        self.response.error = ErrorTestDouble()
        
        XCTAssertTrue(TDD_NetworkJSONHandler.jsonWithResponse(self.response, error: &self.error) == nil)
        XCTAssertTrue(self.error!.domain == TDD_NetworkJSONHandler_ErrorDomain)
        XCTAssertTrue(self.error!.code == TDD_NetworkJSONHandler_ResponseError)
        XCTAssertTrue(self.error!.userInfo![NSUnderlyingErrorKey] === self.response.error)
    }
    
    func testDataError() {
        self.response.error = ErrorTestDouble()
        self.response.response = ResponseTestDouble()
        
        XCTAssertTrue(TDD_NetworkJSONHandler.jsonWithResponse(self.response, error: &self.error)==nil)
        XCTAssertTrue(self.error!.domain == TDD_NetworkJSONHandler_ErrorDomain)
        XCTAssertTrue(self.error!.code == TDD_NetworkJSONHandler_DataError)
        XCTAssertTrue(self.error!.userInfo![NSUnderlyingErrorKey] === self.response.error)
    }
    
    func testSuccess () {
        
        self.response.data = DataTestDouble()
        self.response.response = ResponseTestDouble()
        
        XCTAssertTrue(NetwrokJSONHandlerTestDouble.jsonWithResponse(self.response, error: &self.error) === NetworkJSONHandler_SerializationTestDouble_JSON)
        XCTAssertTrue(NetworkJSONHandler_SerializationTestDouble_Data === self.response.data)
        XCTAssertTrue(NetworkJSONHandler_SerializationTestDouble_Options!.rawValue == 0)
        XCTAssertTrue(self.error === NetworkJSONHandler_SerializationTestDouble_Error)
    }
}

final class NetwrokJSONHandlerTestDouble: TDD_NetworkJSONHandler {
    override class func serializationClass() -> AnyClass {
        return NetwrokJSONHandler_SerializationTestDouble.self
    }
}