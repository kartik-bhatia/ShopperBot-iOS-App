//
//  CartViewController.h
//  TheApp
//
//  Created by Nuvo Logistics on 18/07/14.
//  Copyright (c) 2014 Nuvo Logistics. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CartViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>


@property(strong, nonatomic)NSManagedObjectContext *context;
@property(strong, nonatomic)NSMutableArray *presentCart;
@property (weak, nonatomic) IBOutlet UITableView *tableOfCart;
//@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
//@property (weak, nonatomic) IBOutlet UIView *viewWithTotal;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UIButton *continueButton;
@property (weak, nonatomic) IBOutlet UIButton *checkoutButton;

@end
