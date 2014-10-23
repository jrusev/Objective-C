#import "Asset.h"
#import "Employee.h"

@implementation Asset

@synthesize label, resaleValue, owner;

- (void)dealloc {
    NSLog(@"Dealocating %@", self);
}

// Overrides NSObject description
- (NSString *)description {
    if ([self owner]) {
        return [NSString stringWithFormat:@"<%@: $%d, owner: %@>",
                [self label], [self resaleValue], [self owner]];
    } else {
        return [NSString stringWithFormat:@"<%@: $%d, owner: %@>", [self label], [self resaleValue], @"no owner"];
    }
    
}

@end
