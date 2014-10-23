#import "Calculator.h"

@implementation Calculator {
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

- (void)addValue:(double)value {
    [_operations appendFormat:@" + %.2f", value];
    _result += value;
}

- (void)subtractValue:(double)value {
    [_operations appendFormat:@" - %.2f", value];
    _result -= value;
}

- (void)divideBy:(double)value {
    [_operations appendFormat:@" / %.2f", value];
    _result /= value;
}

- (void)multiplyBy:(double)value {
    [_operations appendFormat:@" * %.2f", value];
    _result *= value;
}

- (void)printResult {
    [_operations appendFormat:@" = %.2f", _result];
    NSLog(@"%@", _operations);
    [self clear];
}

@end
