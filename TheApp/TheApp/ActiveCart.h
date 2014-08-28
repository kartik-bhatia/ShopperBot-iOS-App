//
//  ActiveCart.h
//  TheApp
//
//  Created by Nuvo Logistics on 09/07/14.
//  Copyright (c) 2014 Nuvo Logistics. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ActiveCart : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * img_url;
@property (nonatomic, retain) NSNumber * latest_price;
@property (nonatomic, retain) NSNumber * mrp;
@property (nonatomic, retain) NSNumber * orderPrice;
@property (nonatomic, retain) NSString * p_name;
@property (nonatomic, retain) NSNumber * qty;

@end
