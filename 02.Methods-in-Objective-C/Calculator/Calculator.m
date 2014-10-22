//
//  Calculator.m
//  Calculator
//

#import "Calculator.h"

@implementation Calculator {
    double _result;
    NSMutableString *_operations;
}

- (id)init {
    self = [super init];
    
    if (self) {
        _operations = [[NSMutableString alloc] init];
        [self clear];
    }
    
    return self;
}

- (void)clear {
    _result = 0;
    [_operations setString:@"0"];
}

- (double)addValue:(double)value {
    [_operations appendFormat:@" + %.2f", value];
    _result += value;
    return _result;
}

- (double)subtractValue:(double)value {
    [_operations appendFormat:@" - %.2f", value];
    _result -= value;
    return _result;
}

- (double)divideBy:(double)value {
    [_operations appendFormat:@" / %.2f", value];
    _result /= value;
    return _result;
}

- (double)multiplyBy:(double)value {
    [_operations appendFormat:@" * %.2f", value];
    _result *= value;
    return _result;
}

- (void)printResult {
    [_operations appendFormat:@" = %.2f", _result];
    NSLog(@"%@", _operations);
    [self clear];
}

@end
