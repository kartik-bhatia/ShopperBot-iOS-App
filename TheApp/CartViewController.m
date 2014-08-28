//
//  CartViewController.m
//  TheApp
//
//  Created by Nuvo Logistics on 18/07/14.
//  Copyright (c) 2014 Nuvo Logistics. All rights reserved.
//

#import "CartViewController.h"
#import "groceryAppDelegate.h"
#import "ActiveCart.h"
#import "CartCellView.h"
#import "URL.h"
#import "UIImageView+AFNetworking.h"

@interface CartViewController ()

@end

@implementation CartViewController

-(NSManagedObjectContext *)getContext
{
    if (!_context){
        groceryAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        
        _context = [appDelegate managedObjectContext];
    }
    return _context;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_presentCart count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"CartCell";
    
    CartCellView *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[CartCellView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    ActiveCart *oneProd = [_presentCart objectAtIndex:indexPath.row];
    cell.titleOfProduct.text = [oneProd valueForKey:@"p_name"];
     NSString *myStringWithNumbers = [NSString stringWithFormat:@"%@",[oneProd valueForKey:@"qty"]];
    cell.qtyOfProduct.text = myStringWithNumbers;
    cell.latestPriceOfItem.text = [NSString stringWithFormat:@"%@", [oneProd valueForKey:@"latest_price"]];
    NSNumber *price = [NSNumber numberWithFloat:([[oneProd valueForKey:@"latest_price"] floatValue] * [[oneProd valueForKey:@"qty"] floatValue])];
    cell.priceOfItem.text = [NSString stringWithFormat:@"%@", price];
    NSString *string = [NSString stringWithFormat:@"%@",[URL getProductImageURLWithImageString:[oneProd valueForKey:@"img_url"]] ];
    
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    UIImage *placeholderImage = [UIImage imageNamed:@"placeholder.jpg"];
    
    [cell.imageOfProduct setImageWithURLRequest:request
                               placeholderImage:placeholderImage
                                        success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                            NSLog(@"In async");
                                            cell.imageOfProduct.image = image;
                                            cell.imageOfProduct.contentMode = UIViewContentModeScaleAspectFit;
                                            [cell setNeedsLayout];
                                            
                                        } failure:nil];
    cell.idOfProduct = [[oneProd valueForKey:@"id"] intValue];
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self formatButton];
    _presentCart = [self getActiveCartWithContext:[self getContext]];
    [self setTotalLabels];
    
    self.tabBarController.tabBar.hidden = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveCartChanged:)
                                                 name:@"CartChangeNotification"
                                               object:nil];
    
   
}

- (void) receiveCartChanged:(NSNotification *) notification{
        [self setTotalLabels];
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

-(NSMutableArray *)getActiveCartWithContext:(NSManagedObjectContext *)context{
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"ActiveCart" inManagedObjectContext:context];
    [request setEntity:entity];
    NSError *error;
    NSMutableArray *mutableFetchResults = [[context executeFetchRequest:request error:&error] mutableCopy];
    return mutableFetchResults;
    
}

-(void)setTotalLabels{
    ActiveCart *oneProd;
    NSNumber *sum = [[NSNumber alloc] initWithFloat:0.0];
    
    for(oneProd in _presentCart){
        NSLog(@"%f", [[oneProd valueForKey:@"latest_price"] floatValue]);
        sum = [NSNumber numberWithFloat:([sum floatValue] + [[oneProd valueForKey:@"latest_price" ] floatValue] * [[oneProd valueForKey:@"qty"] intValue])];
    }
    NSLog(@"%@", sum);
    self.totalLabel.text = [NSString stringWithFormat:@"Rs %@", sum];
}

-(void)formatButton{
    self.continueButton.layer.borderWidth = 1.0f;
    self.checkoutButton.layer.borderWidth = 1.0f;
    [self.checkoutButton.layer setCornerRadius:10.0f];
    [self.continueButton.layer setCornerRadius:10.0f];
    UIColor* grey70 = [UIColor colorWithWhite: 0.70 alpha:1];
    [self.continueButton.layer setBorderColor:grey70.CGColor];
    [self.checkoutButton.layer setBorderColor:grey70.CGColor];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_context deleteObject:[_presentCart objectAtIndex:indexPath.row]];
        [_presentCart removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        NSError *error;
        [_context save:&error];
        [[NSNotificationCenter defaultCenter]
         postNotificationName:@"SomeChangeInCart"
         object:self userInfo:nil];
    } else {
        NSLog(@"Unhandled editing style! %d", editingStyle);
    }
}
@end
