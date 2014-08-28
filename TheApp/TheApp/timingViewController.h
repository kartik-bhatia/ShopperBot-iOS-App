//
//  timingViewController.h
//  TheApp
//
//  Created by Nuvo Logistics on 22/07/14.
//  Copyright (c) 2014 Nuvo Logistics. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface timingViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (strong, nonatomic)NSMutableArray *dayAndDate;
@property (strong, nonatomic)NSArray *timeSlots;
@property (weak, nonatomic) IBOutlet UILabel *timeSlot;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UILabel *dayDate;

@end
