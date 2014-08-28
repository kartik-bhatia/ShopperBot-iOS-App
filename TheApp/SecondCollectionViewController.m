//
//  CategoryViewController.m
//  TheApp
//
//  Created by Nuvo Logistics on 30/06/14.
//  Copyright (c) 2014 Nuvo Logistics. All rights reserved.
//

#import "SecondCollectionViewController.h"
#import "SubCategoryCell.h"
#import "UIImageView+AFNetworking.h"
#import "AFNetworking.h"
#import "URL.h"
#import "groceryAppDelegate.h"
#include "ActiveCart.h"


@interface SecondCollectionViewController ()


@end

@implementation SecondCollectionViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _productsInActiveCart = [self getActiveCartWithContext:[self getContext]];
    
    // Do any additional setup after loading the view.
    [self downloadProductJSON];
}


- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView
    numberOfItemsInSection:(NSInteger)section
{
//    return 8;
    return [_products count];
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    __weak SubCategoryCell *myCell = [collectionView
                            dequeueReusableCellWithReuseIdentifier:@"SubCategoryCell"
                            forIndexPath:indexPath];
    int row = [indexPath row];
    NSDictionary *oneProductDictionary = _products[row];
//    NSLog(@"ROW IS %i", row);
    
//    NSDictionary *oneProductDictionary = @{
//                                            @"title" : @"MILK",
//                                            @"features_image" : @"ba",
//                                            @"id" : [NSNumber numberWithInt:9],
//                                            };

    myCell.context = _managedObjectContext;
    myCell.productInfo = oneProductDictionary;
    BOOL alreadyInCart = NO;
    if(_productsInActiveCart){
        
        for (ActiveCart *prod in _productsInActiveCart){

            if ([[prod valueForKey:@"id"] intValue] == [[oneProductDictionary valueForKey:@"id"] intValue]){
                alreadyInCart = YES;
                NSString *myStringWithNumbers = [NSString stringWithFormat:@"%@",[prod valueForKey:@"qty"]];
                [myCell.qtyLabel setText:myStringWithNumbers];
                break;
            }
        }
        
    }
    if (!alreadyInCart) {
        myCell.qtyLabel.text = @"0";
    }
    [myCell.productLabel setText:oneProductDictionary[@"title"]];
    NSString *string = [NSString stringWithFormat:@"%@",[URL getProductImageURLWithImageString:oneProductDictionary[@"image"]] ];
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    UIImage *placeholderImage = [UIImage imageNamed:@"placeholder.jpg"];
    
    [myCell.productImage setImageWithURLRequest:request
                                placeholderImage:placeholderImage
                                         success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                            
                                            myCell.productImage.image = image;
                                             [myCell setNeedsLayout];
                                             
                                         } failure:nil];
    myCell.layer.borderColor = [UIColor colorWithWhite:0.8f alpha:1.0f].CGColor;
    myCell.layer.borderWidth = 2.0f;
    return myCell;
}



-(void)downloadProductJSON{
    
    NSString *string = [NSString stringWithFormat:@"%@", [URL getProductURLWithSubCategoryID:_subIdentity categoryID:_identity]];
    
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        _products = (NSArray *)responseObject;
        [self.collectionView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Categories"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
    }];
    
    [operation start];
    
    
    
}



-(NSMutableArray *)getActiveCartWithContext:(NSManagedObjectContext *)context{
    NSLog(@"get active cart");
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"ActiveCart" inManagedObjectContext:context];
    [request setEntity:entity];
    NSError *error;
    NSMutableArray *mutableFetchResults = [[context executeFetchRequest:request error:&error] mutableCopy];
    return mutableFetchResults;
    
}


-(NSManagedObjectContext *)getContext
{
    if (!_managedObjectContext){
        groceryAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        
        _managedObjectContext = [appDelegate managedObjectContext];
    }
    return _managedObjectContext;
}

- (IBAction)unwindToViewControllerNameHere:(UIStoryboardSegue *)segue {
    //nothing goes here
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _productsInActiveCart = [self getActiveCartWithContext:[self getContext]];
    [self.collectionView reloadData];
}

@end
