//
//  Portfolio.m
//  Stocks
//
//  Created by JR on 10/19/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import "Portfolio.h"
#import "StockHolding.h"

@implementation Portfolio

- (void)addStockHolding:(StockHolding *)stocks
{
    if (!stockHoldings) {
        stockHoldings = [[NSMutableArray alloc] init];
    }
    [stockHoldings addObject:stocks];    
}

- (float)currentValue
{
    float currentValue = 0;
    for (StockHolding *s in stockHoldings) {
        // prices should be passed as dictionary
        float randPrice = random() % 100;
        currentValue += [s valueInDollars:randPrice];
    }
    return currentValue;
}

- (float)totalCost
{
    float currentCost = 0;
    for (StockHolding *s in stockHoldings) {
        currentCost += [s costInDollars];
    }
    return currentCost;
}
     
@end
