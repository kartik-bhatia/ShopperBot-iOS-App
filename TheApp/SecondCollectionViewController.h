//
//  SecondCollectionViewController.h
//  TheApp
//
//  Created by Nuvo Logistics on 03/07/14.
//  Copyright (c) 2014 Nuvo Logistics. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondCollectionViewController : UICollectionViewController

@property(strong, nonatomic)NSObject *identity;
@property(strong, nonatomic)NSObject *subIdentity;
@property(strong, nonatomic)NSArray *products;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;
@property (strong, nonatomic)NSMutableArray *productsInActiveCart;
@end
