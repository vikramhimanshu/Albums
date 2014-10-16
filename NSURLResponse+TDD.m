//
//  NSURLResponse+TDD.m
//  Albums
//
//  Created by Himanshu Tantia on 10/14/14.
//  Copyright (c) 2014 Himanshu. All rights reserved.
//

#import "NSURLResponse+TDD.h"

@implementation NSHTTPURLResponse (TDD)

-(NSInteger)inv_statuscode
{
    return [self statusCode];
}

@end

@implementation NSURLResponse (TDD)

-(NSInteger)inv_statuscode
{
    return 0;
}

@end
