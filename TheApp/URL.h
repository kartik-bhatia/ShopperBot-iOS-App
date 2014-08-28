//
//  URL.h
//  TheApp
//
//  Created by Nuvo Logistics on 04/07/14.
//  Copyright (c) 2014 Nuvo Logistics. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URL : NSObject

+(NSString *)getTotalCategoriesURL;
+(NSString *)getImageURLWithImageString:(NSString *)imgString;
+(NSString *)getSubCategoriesURLWithCategoryID:(NSObject *)identity;
+(NSString *)getProductURLWithSubCategoryID:(NSObject *)subidentity categoryID:(NSObject *)identity;

+(NSString *)getProductImageURLWithImageString:(NSString *)prodimgString;
@end
