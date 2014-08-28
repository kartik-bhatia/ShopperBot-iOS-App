//
//  MyHTTPRequestOperation.h
//  TheApp
//
//  Created by Nuvo Logistics on 07/07/14.
//  Copyright (c) 2014 Nuvo Logistics. All rights reserved.
//

#import "AFHTTPRequestOperation.h"

@interface MyHTTPRequestOperation : AFHTTPRequestOperation

- (void)mysetCompletionBlockWithSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                              failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;



@end
