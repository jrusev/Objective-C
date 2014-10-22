//
//  main.m
//  Calculator
//

#import <Foundation/Foundation.h>
#import "Calculator.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Calculator *calc = [[Calculator alloc] init];
        
        [calc addValue:2.5];
        [calc multiplyBy:2.0];
        [calc printResult];
        
        [calc addValue:9.0];
        [calc divideBy:3.0];
        [calc subtractValue:1.0];
        [calc printResult];
    }
    return 0;
}
