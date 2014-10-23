//
//  Portfolio.h
//  Stocks
//
//  Created by JR on 10/19/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import <Foundation/Foundation.h>
@class StockHolding;

@interface Portfolio : NSObject
{
    NSMutableArray *stockHoldings;
}

- (void)addStockHolding:(StockHolding *)stocks;
- (float)currentValue;
- (float)totalCost;

@end
