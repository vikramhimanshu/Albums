//
//  TDD_NetworkJSONHandler.h
//  Albums
//
//  Created by Himanshu Tantia on 10/13/14.
//  Copyright (c) 2014 Himanshu. All rights reserved.
//


//@import Foundation; - free with TDD_NetworkResponse.h

#import "TDD_NetworkResponse.h"

FOUNDATION_EXTERN NSString *const TDD_NetworkJSONHandler_ErrorDomain;
FOUNDATION_EXTERN const NSInteger TDD_NetworkJSONHandler_ResponseError;
FOUNDATION_EXTERN const NSInteger TDD_NetworkJSONHandler_DataError;

@protocol TDD_NetworkJSONHandler_SerialzationType <NSObject>

+ (id)JSONObjectWithData:(NSData *)data options:(NSJSONReadingOptions)options error:(NSError *__autoreleasing *)error;

@end

@interface NSJSONSerialization (TDD_NetworkJSONHandler_SerialzationType) <TDD_NetworkJSONHandler_SerialzationType>

@end

@implementation NSJSONSerialization (TDD_NetworkJSONHandler_SerialzationType)

@end

@interface TDD_NetworkJSONHandler : NSObject

@end

@interface TDD_NetworkJSONHandler (Class)

+ (Class <TDD_NetworkJSONHandler_SerialzationType>)serializationClass;

@end

@interface TDD_NetworkJSONHandler (JSON)

+(id)jsonWithResponse:(TDD_NetworkResponse *)response error:(NSError **)error;

@end
