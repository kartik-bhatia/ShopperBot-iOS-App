//
//  timingViewController.m
//  TheApp
//
//  Created by Nuvo Logistics on 22/07/14.
//  Copyright (c) 2014 Nuvo Logistics. All rights reserved.
//

#import "timingViewController.h"

@interface timingViewController ()

@end

@implementation timingViewController

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
    NSLog(@"VIEW DID LOAD    ");
    // Do any additional setup after loading the view.
    _nextButton.layer.borderWidth = 0.8f;
    [_nextButton.layer setCornerRadius:10.0f];
    UIColor* grey70 = [UIColor colorWithWhite: 0.70 alpha:1];
    [_nextButton.layer setBorderColor:grey70.CGColor];
    [self modifyDateArrayForPicker];
    [self modifyTimeSlotArrayForPicker];
    _picker.showsSelectionIndicator = YES;
    [_picker selectRow:0 inComponent:0 animated:YES];
    
    
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
    
    return 2;
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component
{
    
    if (component == 0) {
            return [_dayAndDate count] ;
    }
    
    else{
        return [_timeSlots count];
    }
    
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    NSLog(@"In did select row  ");
    if (component == 0) {
        NSInteger firstComponentRow = [_picker selectedRowInComponent:0];
        _dayDate.text = [_dayAndDate objectAtIndex:firstComponentRow];
        
    }
    if (component == 1) {
        NSInteger secondComponentRow = [_picker selectedRowInComponent:1];
        _timeSlot.text = [_timeSlots objectAtIndex:secondComponentRow];
    }

}

-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"VIEW WILL APPEAR");
    [self modifyDateArrayForPicker];
    [self modifyTimeSlotArrayForPicker];
    [_picker reloadAllComponents];
    
    
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 37)];
    if (component == 0) {
        label.text = [NSString stringWithFormat:@"%@ ", [_dayAndDate objectAtIndex:row]];
        label.textAlignment = NSTextAlignmentCenter; //Changed to NS as UI is deprecated.
        label.backgroundColor = [UIColor clearColor];
    }
    
    if (component == 1) {
        label.text = [NSString stringWithFormat:@"%@ ", [_timeSlots objectAtIndex:row]];
        label.textAlignment = NSTextAlignmentCenter; //Changed to NS as UI is deprecated.
        label.backgroundColor = [UIColor clearColor];
    }
    
    
    return label;
}


-(void)modifyDateArrayForPicker{
    int i;
    NSDateFormatter *dateformat=[[NSDateFormatter alloc]init];
    
    [dateformat setDateFormat:@"EE MMMM, dd"];
    NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
    [timeFormat setDateFormat:@"HH"];
    
    NSDate *now = [NSDate date];
    NSString *time_string = [timeFormat stringFromDate:now];
    int currhour = [time_string intValue];
    
    NSDateComponents *dateComponents = [NSDateComponents new];
    _dayAndDate = [[NSMutableArray alloc] init];
    if (currhour >= 18) {
        i = 1;
    }
    else{
        i = 0;
    }
    for (; i<7; i++) {
        dateComponents.day = i;
        NSDate *newDate = [[NSCalendar currentCalendar]dateByAddingComponents: dateComponents
                                                                       toDate:now
                                                                      options:0];
        
        NSString *dateString = [dateformat stringFromDate:newDate];
        [_dayAndDate addObject:dateString];
        
    }

}

-(void)modifyTimeSlotArrayForPicker{
//Use this function for timeslot logic
//    NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
//    [timeFormat setDateFormat:@"HH"];
//    NSDate *now = [NSDate date];
//    NSString *time_string = [timeFormat stringFromDate:now];
    _timeSlots  = [[NSArray alloc] initWithObjects:@"10AM - 12PM",@"12PM - 2PM",@"02PM - 04PM",@"04PM - 06PM",@"06PM - 08PM",nil];
    
    
}

@end
