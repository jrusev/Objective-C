#import <Foundation/Foundation.h>
#import "ForeignStockHolding.h"
#import "Portfolio.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Portfolio *portfolio = [[Portfolio alloc] init];
        
        for (int i = 0; i < 10; i++) {
            ForeignStockHolding *stocks = [[ForeignStockHolding alloc] init];
            stocks.numberOfShares = 100;
            stocks.purchaseSharePrice = random() % 100;
            stocks.conversionRate = 0.5;
            
            NSLog(@"stock%d: %.2f", i, stocks.purchaseSharePrice);

            [portfolio addStockHolding:stocks];
        }
        NSLog(@"Total cost of portfolio: %.2f", [portfolio totalCost]);
        NSLog(@"Current value of portfolio: %.2f", [portfolio currentValue]);
    }
    return 0;
}
