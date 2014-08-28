//
//  paymentModeViewController.m
//  TheApp
//
//  Created by Nuvo Logistics on 24/07/14.
//  Copyright (c) 2014 Nuvo Logistics. All rights reserved.
//

#import "paymentModeViewController.h"

@interface paymentModeViewController ()

@end

@implementation paymentModeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.nextButton.layer.borderWidth = 0.8f;
    
    [self.nextButton.layer setCornerRadius:10.0f];
    UIColor* grey70 = [UIColor colorWithWhite: 0.70 alpha:1];
    [self.nextButton.layer setBorderColor:grey70.CGColor];

    [self setPayementModeArray];
    _selectedPaymentMode.text = [_paymentOptions objectAtIndex:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component
{
    return [_paymentOptions count];
    
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component
{
    
    return [_paymentOptions objectAtIndex:row];
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    _selectedPaymentMode.text = [_paymentOptions objectAtIndex:row];
    
}


-(void)setPayementModeArray{
    
    _paymentOptions = [[NSMutableArray alloc] initWithObjects:@"Cash On Delivery", @"Card On Delivery", @"Sodexo Coupons", @"Credit Card", @"Debit Card", @"NetBanking", nil];

}

@end
