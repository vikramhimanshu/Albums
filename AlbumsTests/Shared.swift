//
//  Shared.swift
//  Albums
//
//  Created by Himanshu Tantia on 10/13/14.
//  Copyright (c) 2014 Himanshu. All rights reserved.
//

import Foundation

func DataTestDouble() -> NSData
{
    var bytes = ([0] as [UInt8])
    return NSData(bytes: &bytes, length: 1);
}

func ErrorTestDouble() -> NSError {
    return NSError(domain: "domain", code: 0, userInfo: nil)
}

func ResponseTestDouble() -> NSURLResponse {
    return NSHTTPURLResponse(URL: URLTestDouble(), statusCode: 200, HTTPVersion: nil, headerFields: nil)!
}

func URLTestDouble() -> NSURL {
    return NSURL(string: "http://localhost/")!
}