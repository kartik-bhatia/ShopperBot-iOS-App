//
//  CartCellView.m
//  TheApp
//
//  Created by Nuvo Logistics on 18/07/14.
//  Copyright (c) 2014 Nuvo Logistics. All rights reserved.
//

#import "CartCellView.h"
#include "ActiveCart.h"
#import "interactWithCoreData.h"

@implementation CartCellView

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)incQty:(UIButton *)sender {
    int number = [_qtyOfProduct.text intValue] + 1;
    NSString *text = [NSString stringWithFormat:@"%i", number];
    _qtyOfProduct.text = text;
    NSManagedObjectContext *context = [interactWithCoreData getContext];
    NSMutableArray *presentCart = [interactWithCoreData getActiveCartWithContext:context];
    for (ActiveCart *prod in presentCart){
        if ([[prod valueForKey:@"id" ] intValue] == self.idOfProduct) {
            int newQuant = [[prod valueForKey:@"qty" ] intValue] + 1;
            [prod setValue:[NSNumber numberWithInt:newQuant] forKeyPath:@"qty"];
            NSNumber *price = [NSNumber numberWithFloat:([[prod valueForKey:@"latest_price"] floatValue] * [[prod valueForKey:@"qty"] floatValue])];
            self.priceOfItem.text = [NSString stringWithFormat:@"%@", price];
            NSError *error;
            [context save:&error];
            break;
        }
        
    }
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"CartChangeNotification"
     object:self userInfo:nil];
}

- (IBAction)decQty:(UIButton *)sender {
    if ([_qtyOfProduct.text intValue] != 0){
        int number = [_qtyOfProduct.text intValue] - 1;
        NSString *text = [NSString stringWithFormat:@"%i", number];
        _qtyOfProduct.text = text;
        NSManagedObjectContext *context = [interactWithCoreData getContext];
        NSMutableArray *presentCart = [interactWithCoreData getActiveCartWithContext:context];
        for (ActiveCart *prod in presentCart){
            if ([[prod valueForKey:@"id" ] intValue] == self.idOfProduct) {
                int newQuant = [[prod valueForKey:@"qty" ] intValue] - 1;
                [prod setValue:[NSNumber numberWithInt:newQuant] forKeyPath:@"qty"];
                NSNumber *price = [NSNumber numberWithFloat:([[prod valueForKey:@"latest_price"] floatValue] * [[prod valueForKey:@"qty"] floatValue])];
                self.priceOfItem.text = [NSString stringWithFormat:@"%@", price];
                NSError *error;
                [context save:&error];
               
                break;
            }
            
        }

    }
    
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"CartChangeNotification"
     object:self userInfo:nil];
    
}
@end
