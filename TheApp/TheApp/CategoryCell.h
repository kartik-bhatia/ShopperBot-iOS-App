//
//  CategoryCell.h
//  TheApp
//
//  Created by Nuvo Logistics on 30/06/14.
//  Copyright (c) 2014 Nuvo Logistics. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface CategoryCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *CategoryImage;
@property (weak, nonatomic) IBOutlet UILabel *CategoryLabel;
@property (nonatomic) NSObject *identity;



@end
