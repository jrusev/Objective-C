//
//  Calculator.h
//  Calculator
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject

@property (readonly) double result;

- (double)addValue:(double)value;
- (double)subtractValue:(double)value;
- (double)divideBy:(double)value;
- (double)multiplyBy:(double)value;
- (void)clear;
- (void)printResult;

@end
