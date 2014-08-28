//
//  interactWithCoreData.h
//  TheApp
//
//  Created by Nuvo Logistics on 21/07/14.
//  Copyright (c) 2014 Nuvo Logistics. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface interactWithCoreData : NSObject

+(NSManagedObjectContext *)getContext;
+(NSMutableArray *)getActiveCartWithContext:(NSManagedObjectContext *)context;
@end
