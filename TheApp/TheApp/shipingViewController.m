//
//  shipingViewController.m
//  TheApp
//
//  Created by Nuvo Logistics on 22/07/14.
//  Copyright (c) 2014 Nuvo Logistics. All rights reserved.
//

#import "shipingViewController.h"
#include "timingViewController.h"
@interface shipingViewController ()

@end

@implementation shipingViewController

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
    [self addDoneToolBarToKeyboard:self.addressText];
    [self loadPinArray];
    [self loadCityArray];
    self.nextButton.layer.borderWidth = 0.8f;
    [self.nextButton.layer setCornerRadius:10.0f];
    UIColor* grey70 = [UIColor colorWithWhite: 0.70 alpha:1];
    [self.nextButton.layer setBorderColor:grey70.CGColor];
    self.pinPicker.hidden = YES;
    self.pinPicker.showsSelectionIndicator = YES;
    self.pinTextField.inputView = self.pinPicker;
    self.cityPicker.hidden = YES;
    self.cityPicker.showsSelectionIndicator = YES;
    self.cityText.inputView = self.cityPicker;
    
    
    
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

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([segue.identifier isEqualToString:@"shipToTiming"]) {
//        timingViewController *destViewController = segue.destinationViewController;
//        destViewController.view.frame = self.view.frame;
//        [super addChildViewController:destViewController];
//        [destViewController didMoveToParentViewController:self];
//    }
//    
//}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component
{
    if (pickerView.tag == 0) {
        
        return [self.pinArray count];
    }
    else{
        return [_cityArray count];
    }
    
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component
{
    
    if (pickerView.tag == 0) {
        
        return [self.pinArray objectAtIndex:row];
    }
    else
        
        return [_cityArray objectAtIndex:row];
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component{
    
    if (pickerView.tag == 0) {
        self.pinTextField.text = [self.pinArray objectAtIndex:row];
    }
    else{
        _pinTextField.text = @"";
        self.cityText.text = [_cityArray objectAtIndex:row];
        
    }
//    self.pinPicker.frame = CGRectZero;
//    self.pinPicker.hidden = YES;
    
    
}

- (void)textFieldDidBeginEditing:(UITextField *)aTextField{
    if ([aTextField isEqual:self.pinTextField]) {
        self.pinPicker.hidden = NO;
        self.pinPicker.showsSelectionIndicator = YES;
        self.pinTextField.inputView = self.pinPicker;
        self.pinTextField.text = [self.pinArray objectAtIndex:0];
        
        
    }
    if ([aTextField isEqual:self.cityText]) {
        _cityPicker.hidden = NO;

        _cityPicker.showsSelectionIndicator = YES;
        _cityText.inputView = self.cityPicker;
        self.cityText.text = [self.cityArray objectAtIndex:[_cityPicker selectedRowInComponent:0]];
    }
    
}



-(IBAction)textFieldReturn:(id)sender
{
    [sender resignFirstResponder];
}

-(BOOL) textFieldShouldReturn: (UITextField *) textField {
    [textField resignFirstResponder];
    return YES;
}

-(void)addDoneToolBarToKeyboard:(UITextView *)textView
{
    UIToolbar* doneToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    doneToolbar.barStyle = UIBarStyleBlackTranslucent;
    doneToolbar.items = [NSArray arrayWithObjects:
                         [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                         [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneButtonClickedDismissKeyboard)],
                         nil];
    [doneToolbar sizeToFit];
    textView.inputAccessoryView = doneToolbar;
}

-(void)doneButtonClickedDismissKeyboard
{
    [self.addressText resignFirstResponder];
}


- (IBAction)tappedOnPicker:(UITapGestureRecognizer *)sender {
    [_cityText resignFirstResponder];
    [self.pinTextField resignFirstResponder];
    

}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return true;
}

-(void)loadPinArray{
    //Implement logic of loading PIN Array
    self.pinArray  = [[NSArray alloc]         initWithObjects:@"124507",@"111001",@"123145",@"890654",@"119876",@"123456" , nil];
}

-(void)loadCityArray{
    //Implement logic of loading City Array
    _cityArray = [[NSArray alloc] initWithObjects:@"Gurgaon", @"Noida", @"Delhi", nil];
    
}


@end
