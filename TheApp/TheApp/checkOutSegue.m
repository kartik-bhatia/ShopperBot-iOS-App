//
//  checkOutSegue.m
//  TheApp
//
//  Created by Nuvo Logistics on 22/07/14.
//  Copyright (c) 2014 Nuvo Logistics. All rights reserved.
//

#import "checkOutSegue.h"

@implementation checkOutSegue

- (void)perform
{
    UIViewController *source = self.sourceViewController;
    UIViewController *destination = self.destinationViewController;
    UIViewController *container = source.parentViewController;
    NSDictionary *info = [[NSDictionary alloc] initWithObjectsAndKeys:source.title ?: [NSNull null], @"source", destination.title ?: [NSNull null], @"destination", nil];
    [container addChildViewController:destination];
    destination.view.frame = source.view.frame;
    [source willMoveToParentViewController:nil];
    
    [container transitionFromViewController:source
                           toViewController:destination
                                   duration:0.4
                                    options:UIViewAnimationOptionTransitionCrossDissolve
                                 animations:^{
                                 }
                                 completion:^(BOOL finished) {
                                     [source removeFromParentViewController];
                                     [destination didMoveToParentViewController:container];
                                     [[NSNotificationCenter defaultCenter]
                                      postNotificationName:@"TestNotification"
                                      object:self userInfo:info];
                                     
                                 }];
}

@end
