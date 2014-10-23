//
//  main.m
//  stockz
//
//  Created by JR on 10/23/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import <Foundation/Foundation.h>

void addToPortfolio(NSMutableArray *portfolio, NSString *ticker, int numShares) {
    NSMutableDictionary *stock = [NSMutableDictionary dictionary];
    [stock setObject:ticker forKey:@"ticker"];
    [stock setObject:[NSNumber numberWithInt:numShares] forKey:@"numShares"];
    [portfolio addObject:stock];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableArray *techStocks = [[NSMutableArray alloc] init];
        addToPortfolio(techStocks, @"AAPL", 200);
        addToPortfolio(techStocks, @"GOOG", 160);
        
        NSString *path = @"/tmp/stocks.plist";
        [techStocks writeToFile:path atomically:YES];
        NSLog(@"Portfolio saved to: %@", path);
        
        NSArray *stockList = [NSArray arrayWithContentsOfFile:path];
        for (NSDictionary *dict in stockList) {
            NSLog(@"%@ shares of %@", dict[@"numShares"], dict[@"ticker"]);
        }
        
    }
    return 0;
}
