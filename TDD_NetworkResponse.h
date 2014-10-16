//
//  TDD_NetworkResponse.h
//  Albums
//
//  Created by Himanshu Tantia on 10/13/14.
//  Copyright (c) 2014 Himanshu. All rights reserved.
//

@import Foundation;

@interface TDD_NetworkResponse : NSObject

@property (nonatomic,strong) NSData *data;
@property (nonatomic,strong) NSError *error;
@property (nonatomic,strong) NSURLResponse *response;

@end
