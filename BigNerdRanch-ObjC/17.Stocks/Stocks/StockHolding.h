//
//  StockHolding.h
//  Stocks
//
//  Created by JR on 10/19/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StockHolding : NSObject
{
    float purchaseSharePrice;
    int numberOfShares;
}

@property float purchaseSharePrice;
@property int numberOfShares;

-(float)costInDollars;
-(float)valueInDollars:(float)currentSharePrice;

@end
