//
//  SecondViewController.m
//  TheApp
//
//  Created by Nuvo Logistics on 03/07/14.
//  Copyright (c) 2014 Nuvo Logistics. All rights reserved.
//

#import "SecondViewController.h"
#import "SecondCollectionViewController.h"
#import "UIImageView+AFNetworking.h"
#import "AFNetworking.h"
#import "URL.h"
#import "ContentViewController.h"
#import "customizeCart.h"


@interface SecondViewController () <ViewPagerDataSource, ViewPagerDelegate>

@property (nonatomic) NSUInteger numberOfTabs;

@end

@implementation SecondViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataSource = self;
    self.delegate = self;
    self.title = @"Products";
    [self downloadSubCategoryJSON];
    self.navigationItem.rightBarButtonItem = [customizeCart customizeCartButtonWithButtton:self.cartButton];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(cartHasChanged)
                                                 name:@"SomeChangeInCart"
                                               object:nil];
    
    
}

-(void)cartHasChanged{
    NSLog(@"In Cart Has Changed");
    self.navigationItem.rightBarButtonItem = [customizeCart customizeCartButtonWithButtton:self.cartButton];

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

- (NSUInteger)numberOfTabsForViewPager:(ViewPagerController *)viewPager {
//    return 7;
    return [_subCategories count];
}

- (UIView *)viewPager:(ViewPagerController *)viewPager viewForTabAtIndex:(NSUInteger)index {
    
    UILabel *label = [UILabel new];
//    label.text = @"temp";
    label.text = [NSString stringWithFormat:@"%@", _subCategories[index][@"title"]];
    [label sizeToFit];
    
    return label;
}

- (UIViewController *)viewPager:(ViewPagerController *)viewPager contentViewControllerForTabAtIndex:(NSUInteger)index {
    
    SecondCollectionViewController *scvc = [self.storyboard instantiateViewControllerWithIdentifier:@"SecondContentViewController"];
    scvc.identity = _tappedOn;
    scvc.subIdentity = _subCategories[index][@"id"];
    
    return scvc;
}

-(void)downloadSubCategoryJSON{
    
    
    NSString *string = [NSString stringWithFormat:@"%@", [URL getSubCategoriesURLWithCategoryID:_tappedOn]];
    
    NSURL *url = [NSURL URLWithString:string];

    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
    
        _subCategories = (NSArray *)responseObject;
        
        [self reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving  Sub Categories"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
    }];
    
    [operation start];
    
    
    
}

- (IBAction)unwindToViewControllerNameHere:(UIStoryboardSegue *)segue {
    //nothing goes here

}

//-(void)viewWillAppear:(BOOL)animated{
//    
//    self.navigationItem.rightBarButtonItem = [customizeCart customizeCartButtonWithButtton:self.cartButton];
//    
//}

@end
