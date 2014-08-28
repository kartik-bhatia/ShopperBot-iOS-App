//
//  URL.m
//  TheApp
//
//  Created by Nuvo Logistics on 04/07/14.
//  Copyright (c) 2014 Nuvo Logistics. All rights reserved.
//

#import "URL.h"

@implementation URL

static NSString *BASE_URL;
static NSString *MEDIA_URL;
static NSString *API_URL;
static NSString *CATEGORIES_URL;
static NSString * PRODUCTS_URL;
static NSString *SUBCATEGORIES_URL;
    


+(void)initialize{
    BASE_URL = @"http://192.168.0.134:8000/";
    MEDIA_URL = @"media/";
    API_URL = @"api/";
    CATEGORIES_URL = @"categories/";
    PRODUCTS_URL = @"products/";
    SUBCATEGORIES_URL = @"subcategories/";
    
}


+(NSString *)getTotalCategoriesURL{
    return [NSString stringWithFormat:@"%@%@%@", BASE_URL, API_URL, CATEGORIES_URL];
}

+(NSString *)getImageURLWithImageString:(NSString *)imgString{
    return [NSString stringWithFormat:@"%@%@%@", BASE_URL, MEDIA_URL, imgString];
}

+(NSString *)getSubCategoriesURLWithCategoryID:(NSObject *)identity{
    
    return [NSString stringWithFormat:@"%@%@/%@", [self getTotalCategoriesURL], identity, SUBCATEGORIES_URL];
}

+(NSString *)getProductImageURLWithImageString:(NSString *)prodimgString{
    return [NSString stringWithFormat:@"%@%@%@", BASE_URL, MEDIA_URL, prodimgString];
}

+(NSString *)getProductURLWithSubCategoryID:(NSObject *)subidentity categoryID:(NSObject *)identity{
    return [NSString stringWithFormat:@"%@%@/%@", [self getSubCategoriesURLWithCategoryID:identity], subidentity, PRODUCTS_URL];
}

@end
