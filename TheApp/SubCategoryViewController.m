//
//  SubCategoryViewController.m
//  TheApp
//
//  Created by Nuvo Logistics on 02/07/14.
//  Copyright (c) 2014 Nuvo Logistics. All rights reserved.
//
#import "SubCategoryCollection.h"
#import "SubCategoryViewController.h"
#import "SHViewPager.h"

@interface SubCategoryViewController () <SHViewPagerDataSource, SHViewPagerDelegate>

@end

@implementation SubCategoryViewController


// total number of pages to be displayed by the controller
- (NSInteger)numberOfPagesInViewPager:(SHViewPager *)viewPager
{
    return 4;
}

// the viewcontroller that will contain the pages, in most of the cases it will be the same viewcontroller that is acting as the datasource and delegate
// i.e. return value will be 'self'
- (UIViewController *)containerControllerForViewPager:(SHViewPager *)viewPager
{
    return self;
}

// the viewcontroller that is to be shown as as a page in the pager
- (UIViewController *)viewPager:(SHViewPager *)viewPager controllerForPageAtIndex:(NSInteger)index
{
    
    SubCategoryCollection *content ;
    return (UIViewController *)content;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end


