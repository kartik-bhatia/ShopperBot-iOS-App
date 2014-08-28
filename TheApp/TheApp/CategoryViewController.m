//
//  CategoryViewController.m
//  TheApp
//
//  Created by Nuvo Logistics on 30/06/14.
//  Copyright (c) 2014 Nuvo Logistics. All rights reserved.
//

#import "CategoryViewController.h"
#import "CategoryCell.h"
#import "UIImageView+AFNetworking.h"
#import "AFNetworking.h"
#import "SecondViewController.h"
#import "URL.h"
#import "MyHTTPRequestOperation.h"
#import "BBBadgeBarButtonItem.h"
#import "customizeCart.h"

static NSString *cellIdentifier = @"CategoryCell";

@interface CategoryViewController ()


@end

@implementation CategoryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self downloadCategoryJSON];
   
    
//    self.navigationItem.rightBarButtonItem = [customizeCart customizeCartButtonWithButtton:self.cartButton];
    [self.navigationItem setRightBarButtonItem:[customizeCart customizeCartButtonWithButtton:self.cartButton] animated:YES];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(cartHasChanged)
                                                 name:@"SomeChangeInCart"
                                               object:nil];
    
}

-(void)cartHasChanged{
    
    [UIView animateWithDuration:2.0f delay:0.1 options:UIViewAnimationOptionCurveEaseOut animations:^{
            //        self->view.autoresizesSubviews = NO;
            [_cartButton setTransform:CGAffineTransformRotate(_cartButton.transform, M_PI*2)];
        } completion:nil];
        
    
    self.navigationItem.rightBarButtonItem = [customizeCart customizeCartButtonWithButtton:_cartButton];
    
}



- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView
    numberOfItemsInSection:(NSInteger)section
{
//    return 10;
        return [_categories count];
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CategoryCell *myCell = [collectionView
                                    dequeueReusableCellWithReuseIdentifier:cellIdentifier
                                    forIndexPath:indexPath];
    
    int row = [indexPath row];
    NSDictionary *oneCategoryDictionary = _categories[row];
//    NSDictionary *oneCategoryDictionary = @{
//                                @"title" : @"MILK",
//                                @"features_image" : @"ba",
//                                @"id" : [NSNumber numberWithInt:9],
//                                };
    [myCell.CategoryLabel setText:oneCategoryDictionary[@"title"]];
    NSURL *url = [NSURL URLWithString:[URL getImageURLWithImageString:oneCategoryDictionary[@"featured_image"]]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    UIImage *placeholderImage = [UIImage imageNamed:@"placeholder.jpg"];
    
    myCell.identity = oneCategoryDictionary[@"id"];
    [myCell.CategoryImage setImageWithURLRequest:request
                          placeholderImage:placeholderImage
                                   success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                       
                                       myCell.CategoryImage.image = image;
                                       [myCell setNeedsLayout];
                                       
                                   } failure:nil];
    myCell.layer.borderColor = [UIColor colorWithWhite:0.8f alpha:1.0f].CGColor;
    myCell.layer.borderWidth = 2.0f;
    
    return myCell;
}



-(void)downloadCategoryJSON{
    
    
    NSString *string = [NSString stringWithFormat:@"%@", [URL getTotalCategoriesURL]];
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    MyHTTPRequestOperation *operation = [[MyHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation mysetCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        _categories = (NSArray *)responseObject;
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowSubCategory"]) {
        CategoryCell *cell = (CategoryCell *)sender;
        SecondViewController *destViewController = segue.destinationViewController;
        destViewController.tappedOn = cell.identity;
        destViewController.hidesBottomBarWhenPushed = YES;
    }
    
}

- (IBAction)unwindToViewControllerNameHere:(UIStoryboardSegue *)segue {
    //nothing goes here
}

-(void) viewWillAppear:(BOOL)animated{
    self.navigationItem.rightBarButtonItem = [customizeCart customizeCartButtonWithButtton:self.cartButton];
    NSLog(@"In view will appear");
    [self.navigationItem setTitle:@"MAIN VIEW " ];
    
}


@end
