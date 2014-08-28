//
//  CategoryViewController.h
//  TheApp
//
//  Created by Nuvo Logistics on 30/06/14.
//  Copyright (c) 2014 Nuvo Logistics. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "URL.h"



@interface CategoryViewController : UICollectionViewController <UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *cartButton;

@property (strong, nonatomic) NSMutableArray *categoryImages;
@property (strong, nonatomic) NSArray *categories;
@property (strong, nonatomic) NSMutableArray *tempImage;


@end

