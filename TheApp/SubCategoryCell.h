//
//  SubCategoryCell.h
//  TheApp
//
//  Created by Nuvo Logistics on 03/07/14.
//  Copyright (c) 2014 Nuvo Logistics. All rights reserved.
//

#import <UIKit/UIKit.h>
#define MYLATESTPRICE 15.5

@interface SubCategoryCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *productImage;
@property (strong, nonatomic) IBOutlet UILabel *productLabel;
@property (strong, nonatomic) IBOutlet UILabel *qtyLabel;
@property (strong, nonatomic) IBOutlet UILabel *mrplabel;
@property (strong, nonatomic) IBOutlet UILabel *orderpricelabel;
@property (strong, nonatomic) NSDictionary *productInfo;
@property(strong, nonatomic)NSManagedObjectContext *context;
- (IBAction)incQty:(UIButton *)sender;
- (IBAction)decQty:(UIButton *)sender;
-(NSManagedObjectContext *)getContext;
-(NSMutableArray *)getActiveCartWithContext:(NSManagedObjectContext *)context;
@end
