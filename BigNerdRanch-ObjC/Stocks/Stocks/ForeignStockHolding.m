//
//  ForeignStockHolding.m
//  Stocks
//
//  Created by JR on 10/19/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import "ForeignStockHolding.h"

@implementation ForeignStockHolding

@synthesize conversionRate;

-(float)costInDollars
{
    float costLocal = [super costInDollars];
    return costLocal * [self conversionRate];
}

-(float)valueInDollars:(float)currentSharePrice
{
    float valueLocal = [super valueInDollars:currentSharePrice];
    return valueLocal * [self conversionRate];
}

@end
