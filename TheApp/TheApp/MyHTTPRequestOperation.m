//
//  MyHTTPRequestOperation.m
//  TheApp
//
//  Created by Nuvo Logistics on 07/07/14.
//  Copyright (c) 2014 Nuvo Logistics. All rights reserved.
//

#import "MyHTTPRequestOperation.h"

@implementation MyHTTPRequestOperation



- (void)mysetCompletionBlockWithSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                                            failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;


{
//    success = void(^)(AFHTTPRequestOperation *operation, id responseObject);
//    failure = void(^)(AFHTTPRequestOperation *operation, NSError *error);
    
    [super setCompletionBlockWithSuccess:success failure:failure];
}

@end
