//
//  SubCategoryCell.m
//  TheApp
//
//  Created by Nuvo Logistics on 03/07/14.
//  Copyright (c) 2014 Nuvo Logistics. All rights reserved.
//

#import "SubCategoryCell.h"
#import "groceryAppDelegate.h"
#import "ActiveCart.h"
@interface SubCategoryCell()

@property(nonatomic)int identityForCart;
@property(strong, nonatomic)NSString* name;
@property(strong, nonatomic)NSString* imagURLString;
@property(nonatomic)double orderPrice;
@property(nonatomic)double MRP;
@property(nonatomic)double latestPrice;
@property(nonatomic)int quantity;

@end

@implementation SubCategoryCell


-(NSManagedObjectContext *)getContext
{
    if (!_context){
        groceryAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        
        _context = [appDelegate managedObjectContext];
    }
    return _context;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (IBAction)incQty:(UIButton *)sender {
    int number = [_qtyLabel.text intValue] + 1;
    NSString *text = [NSString stringWithFormat:@"%i", number];
    _qtyLabel.text = text;
    
    NSMutableArray *presentCart = [self getActiveCartWithContext:_context];
    BOOL alreadyInCart = NO;
    for (ActiveCart *prod in presentCart){
        if ([[prod valueForKey:@"id" ] intValue] == [[self.productInfo valueForKey:@"id"] intValue]) {
            alreadyInCart = YES;
            int newQuant = [[prod valueForKey:@"qty" ] intValue] + 1;
            [prod setValue:[NSNumber numberWithInt:newQuant] forKeyPath:@"qty"];
            
            break;
        }
        
    }
    if (!alreadyInCart) {
        ActiveCart *product;
        product = [NSEntityDescription insertNewObjectForEntityForName:@"ActiveCart" inManagedObjectContext:_context];
        int initQuant = 1;
        [product setValue:[NSNumber numberWithInt:initQuant] forKeyPath:@"qty"];
        [product setValue:_productLabel.text  forKey:@"p_name"];
        [product setValue: [NSNumber numberWithDouble:[_orderpricelabel.text doubleValue]] forKey:@"orderPrice"];
        [product setValue:_productInfo[@"id"] forKey:@"id"];
        [product setValue:_productInfo[@"image"] forKey:@"img_url"];
        [product setValue:[NSNumber numberWithDouble:MYLATESTPRICE] forKey:@"latest_price"];
        NSError *error;
        [_context save:&error];
        [[NSNotificationCenter defaultCenter]
         postNotificationName:@"SomeChangeInCart"
         object:self userInfo:nil];
        
    }
    NSError *error;
    
    [_context save:&error];
    
 
    
}

- (IBAction)decQty:(UIButton *)sender {
    if ([_qtyLabel.text intValue]) {
        int number = [_qtyLabel.text intValue] - 1;
        NSString *text = [NSString stringWithFormat:@"%i", number];
        _qtyLabel.text = text;
        NSManagedObjectContext *context = [self getContext];
        NSMutableArray *presentCart = [self getActiveCartWithContext:context];
        BOOL alreadyInCart = NO;
        for (ActiveCart *prod in presentCart){
            if ([prod valueForKey:@"id"] == [self.productInfo valueForKey:@"id"]) {
                alreadyInCart = YES;
                NSLog(@"%@", [self.productInfo valueForKey:@"id"]);
                int newQuant = [[prod valueForKey:@"qty" ] intValue] - 1;
                if (newQuant <=0){
                    [context deleteObject:prod];
                    [[NSNotificationCenter defaultCenter]
                     postNotificationName:@"SomeChangeInCart"
                     object:self userInfo:nil];
                }
                else{
                    [prod setValue:[NSNumber numberWithInt:newQuant] forKeyPath:@"qty"];
                    
                    break;
                    
                }
            }
            
        }
        NSError *error;
        
        [context save:&error];
        [_context save:&error];
        
        
    }
    
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

//-(void)printCoreData{
//    NSLog(@"print core data");
//    NSFetchRequest *request = [[NSFetchRequest alloc] init];
//    NSEntityDescription *entity = [NSEntityDescription entityForName:@"ActiveCart" inManagedObjectContext:_context];
//    [request setEntity:entity];
//    NSError *error;
//    NSArray *fetchResults = [_context executeFetchRequest:request error:&error] ;
//
//    ActiveCart *aProduct;
//    for (aProduct in fetchResults)
//        NSLog(@"aProduct.p_name=%@   itsQuantity=%@  itsID=%d", [aProduct valueForKey:@"p_name"], [aProduct valueForKey:@"qty"], [[aProduct valueForKey:@"id"] intValue]);
//    
//}

-(void)viewWillAppear{
    [self reloadInputViews];
}
@end

