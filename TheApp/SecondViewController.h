//
//  SecondViewController.h
//  TheApp
//
//  Created by Nuvo Logistics on 03/07/14.
//  Copyright (c) 2014 Nuvo Logistics. All rights reserved.
//

#import "ViewPagerController.h"

@interface SecondViewController : ViewPagerController

@property(strong, nonatomic)NSObject *tappedOn;
@property(strong, nonatomic)NSArray *subCategories;

@property (weak, nonatomic) IBOutlet UIButton *cartButton;

@end
