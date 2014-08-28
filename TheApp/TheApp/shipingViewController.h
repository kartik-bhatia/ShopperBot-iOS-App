//
//  shipingViewController.h
//  TheApp
//
//  Created by Nuvo Logistics on 22/07/14.
//  Copyright (c) 2014 Nuvo Logistics. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface shipingViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate, UITextFieldDelegate, UIGestureRecognizerDelegate>

- (IBAction)tappedOnPicker:(UITapGestureRecognizer *)sender;
@property (weak, nonatomic) IBOutlet UITextView *addressText;
@property (weak, nonatomic) IBOutlet UITextField *cityText;

@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIPickerView *pinPicker;
@property (weak, nonatomic) IBOutlet UITextField *pinTextField;

@property (strong, nonatomic) NSArray *pinArray;
@property (weak, nonatomic) IBOutlet UIPickerView *cityPicker;
@property (strong, nonatomic) NSArray *cityArray;

@end
