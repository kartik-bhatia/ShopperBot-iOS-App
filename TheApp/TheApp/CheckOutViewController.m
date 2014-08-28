//
//  CheckOutViewController.m
//  TheApp
//
//  Created by Nuvo Logistics on 22/07/14.
//  Copyright (c) 2014 Nuvo Logistics. All rights reserved.
//

#import "CheckOutViewController.h"

@interface CheckOutViewController ()

@end

@implementation CheckOutViewController

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
    [self changeViewOfTopBar];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveTestNotification:)
                                                 name:@"TestNotification"
                                               object:nil];
    
}

- (void) receiveTestNotification:(NSNotification *) notification
{
    // [notification name] should always be @"TestNotification"
    // unless you use this method for observation of other notifications
    // as well.
    
    if ([[notification name] isEqualToString:@"TestNotification"]){
        NSDictionary *dict = [notification userInfo];
        
        if ([[dict objectForKey:@"source"] isEqualToString:@"shippingView"]) {
            
            [_topBarWithIcons.firstStep setBackgroundColor:[UIColor redColor]];
        }
        
        if ([[dict objectForKey:@"source"] isEqualToString:@"timingView"]) {
            
            if ([[dict objectForKey:@"destination"] isEqualToString:@"paymentModeView"]) {
                    [_topBarWithIcons.secondStep setBackgroundColor:[UIColor redColor]];
            }
            else if ([[dict objectForKey:@"destination"] isEqualToString:@"shippingView"]){
                    [_topBarWithIcons.firstStep setBackgroundColor:[UIColor whiteColor]];
            }
        }
        
        if ([[dict objectForKey:@"source"] isEqualToString:@"paymentModeView"]) {
            if ([[dict objectForKey:@"destination"] isEqualToString:@"paymentMerchantView"]) {
                [_topBarWithIcons.thirdStep setBackgroundColor:[UIColor redColor]];
            }
            else if ([[dict objectForKey:@"destination"] isEqualToString:@"timingView"]){
                [_topBarWithIcons.secondStep setBackgroundColor:[UIColor whiteColor]];
            }
        }
    }
        
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)changeViewOfTopBar{

    _topBarWithIcons.reviewCart.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _topBarWithIcons.reviewCart.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_topBarWithIcons.reviewCart setTitle: @"Review\nCart" forState: UIControlStateNormal];
   
    _topBarWithIcons.firstStep.layer.cornerRadius = _topBarWithIcons.firstStep.frame.size.width / 2;;
    _topBarWithIcons.secondStep.layer.cornerRadius = _topBarWithIcons.secondStep.frame.size.width / 2;
    _topBarWithIcons.thirdStep.layer.cornerRadius = _topBarWithIcons.thirdStep.frame.size.width / 2;
    _topBarWithIcons.fourthStep.layer.cornerRadius = _topBarWithIcons.thirdStep.frame.size.width / 2;
    _topBarWithIcons.firstStep.clipsToBounds =YES;
    _topBarWithIcons.secondStep.clipsToBounds =YES;
    _topBarWithIcons.thirdStep.clipsToBounds =YES;
    _topBarWithIcons.fourthStep.clipsToBounds =YES;

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

@end
