//
//  CartCellView.h
//  TheApp
//
//  Created by Nuvo Logistics on 18/07/14.
//  Copyright (c) 2014 Nuvo Logistics. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CartCellView : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleOfProduct;
@property (weak, nonatomic) IBOutlet UILabel *qtyOfProduct;
@property (weak, nonatomic) IBOutlet UILabel *latestPriceOfItem;
@property (weak, nonatomic) IBOutlet UILabel *priceOfItem;

@property (weak, nonatomic) IBOutlet UIImageView *imageOfProduct;
@property (nonatomic) int idOfProduct;
- (IBAction)incQty:(UIButton *)sender;
- (IBAction)decQty:(UIButton *)sender;


@end
