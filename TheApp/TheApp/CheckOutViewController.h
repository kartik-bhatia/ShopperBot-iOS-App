//
//  CheckOutViewController.h
//  TheApp
//
//  Created by Nuvo Logistics on 22/07/14.
//  Copyright (c) 2014 Nuvo Logistics. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "topBarWithCompletionCircles.h"


@interface CheckOutViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *detailView;
@property (weak, nonatomic) IBOutlet topBarWithCompletionCircles *topBarWithIcons;

@end
