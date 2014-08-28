//
//  paymentModeViewController.h
//  TheApp
//
//  Created by Nuvo Logistics on 24/07/14.
//  Copyright (c) 2014 Nuvo Logistics. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface paymentModeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIPickerView *paymentModePicker;
@property (weak, nonatomic) IBOutlet UILabel *selectedPaymentMode;
@property (strong, nonatomic)NSMutableArray *paymentOptions;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@end
