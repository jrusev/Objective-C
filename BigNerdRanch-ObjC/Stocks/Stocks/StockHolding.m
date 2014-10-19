//
//  StockHolding.m
//  Stocks
//
//  Created by JR on 10/19/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import "StockHolding.h"

@implementation StockHolding

@synthesize purchaseSharePrice, numberOfShares;

-(float)costInDollars
{
    return [self purchaseSharePrice] * [self numberOfShares];
}

-(float)valueInDollars:(float)currentSharePrice
{
    return currentSharePrice * [self numberOfShares];
}

@end
