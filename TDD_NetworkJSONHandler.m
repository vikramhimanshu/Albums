//
//  TDD_NetworkJSONHandler.m
//  Albums
//
//  Created by Himanshu Tantia on 10/13/14.
//  Copyright (c) 2014 Himanshu. All rights reserved.
//

#import "NSURLResponse+TDD.h"

#import "TDD_NetworkJSONHandler.h"

NSString *const TDD_NetworkJSONHandler_ErrorDomain = @"TDD_NetworkJSONHandler_ResponseError";
const NSInteger TDD_NetworkJSONHandler_ResponseError = 1;
const NSInteger TDD_NetworkJSONHandler_DataError = 2;

@implementation TDD_NetworkJSONHandler

@end

@implementation TDD_NetworkJSONHandler (Class)

+(Class<TDD_NetworkJSONHandler_SerialzationType>)serializationClass {
    return [NSJSONSerialization class];
}

@end

@implementation TDD_NetworkJSONHandler (JSON)

+(id)jsonWithResponse:(TDD_NetworkResponse *)response error:(NSError **)error
{
    switch ([[response response] inv_statuscode]) {
        case 200:
        {
            if ([response data]) {
                return [[self serializationClass] JSONObjectWithData:[response data] options:0 error:error];
            }
            if (error) {
                *error = [[NSError alloc] initWithDomain: TDD_NetworkJSONHandler_ErrorDomain
                                                    code: TDD_NetworkJSONHandler_DataError
                                                userInfo: ([response error]? @{NSUnderlyingErrorKey:[response error]} : 0)];
            }
            break;
        }
            
        default:
        {
            if (error) {
                *error = [[NSError alloc] initWithDomain: TDD_NetworkJSONHandler_ErrorDomain
                                                    code: TDD_NetworkJSONHandler_ResponseError
                                                userInfo: ([response error]? @{NSUnderlyingErrorKey:[response error]} : 0)];
            }

            break;
        }
    }
    
    return 0;
}

@end
