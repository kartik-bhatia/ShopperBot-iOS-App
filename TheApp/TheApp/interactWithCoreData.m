//
//  interactWithCoreData.m
//  TheApp
//
//  Created by Nuvo Logistics on 21/07/14.
//  Copyright (c) 2014 Nuvo Logistics. All rights reserved.
//

#import "interactWithCoreData.h"
#import "groceryAppDelegate.h"

@implementation interactWithCoreData

+(NSManagedObjectContext *)getContext
{
    
    groceryAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    return context;
}

+(NSMutableArray *)getActiveCartWithContext:(NSManagedObjectContext *)context{
   
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"ActiveCart" inManagedObjectContext:context];
    [request setEntity:entity];
    NSError *error;
    NSMutableArray *mutableFetchResults = [[context executeFetchRequest:request error:&error] mutableCopy];
    return mutableFetchResults;
    
}
@end
