//
//  customizeCart.m
//  TheApp
//
//  Created by Nuvo Logistics on 22/07/14.
//  Copyright (c) 2014 Nuvo Logistics. All rights reserved.
//

#import "customizeCart.h"
#import "interactWithCoreData.h"


@implementation customizeCart

+(BBBadgeBarButtonItem *)customizeCartButtonWithButtton:(UIButton *)cartButton{
//    [cartButton setBackgroundImage:[UIImage animatedImageNamed:@"trolley.png" duration:2.0] forState:UIControlStateNormal];
        BBBadgeBarButtonItem *barButton = [[BBBadgeBarButtonItem alloc] initWithCustomUIButton:cartButton];
    // Set a value for the badge
//    NSString *prev = [NSString stringWithFormat:@"%@", barButton.badgeValue];
    
    NSLog(@"before getting context");
    NSManagedObjectContext *context = [interactWithCoreData getContext];
    NSString *stringOfCount = [NSString stringWithFormat:@"%lu", (unsigned long)[[interactWithCoreData getActiveCartWithContext:context] count]];
    
    
    NSLog(@"after getting Cart");
    NSLog(@"String count is %@", stringOfCount);
//    if ((unsigned long)[[interactWithCoreData getActiveCartWithContext:context] count] == 0) {
//        stringOfCount = @"";
//    }
    if ([stringOfCount isEqualToString:@"0"]) {
        NSLog(@"in if checking 0 of count");
        stringOfCount = nil;
        
    }
//    if ([prev isEqualToString:stringOfCount] == NO) {
//        [UIView animateWithDuration:0.6f delay:0.1 options:UIViewAnimationOptionCurveEaseOut animations:^{
//            //        self->view.autoresizesSubviews = NO;
//            [cartButton setTransform:CGAffineTransformRotate(cartButton.transform, M_PI)];
//        } completion:nil];
//
//    }
    barButton.badgeValue = stringOfCount;
    
    NSLog(@"badge actual value %@", barButton.badgeValue);
    
    // Add it as the leftBarButtonItem of the navigation bar
    return barButton;
    
}

@end
