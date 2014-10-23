#import <Foundation/Foundation.h>

// A class for performing simple math operations
@interface Calculator : NSObject

@property (readonly) double result;

- (void)addValue:(double)value;
- (void)subtractValue:(double)value;
- (void)divideBy:(double)value;
- (void)multiplyBy:(double)value;
- (void)clear;
- (void)printResult;

@end
