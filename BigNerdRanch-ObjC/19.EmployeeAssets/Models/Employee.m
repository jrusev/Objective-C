#import "Employee.h"
#import "Asset.h"

@implementation Employee

@synthesize employeeId;

- (void)addAssetsObject:(Asset *)a {
    // lazy
    if (!assets) {
        assets = [[NSMutableSet alloc] init];
    }
    [assets addObject:a];
    [a setOwner:self];
}

- (unsigned int)valueOfAssets {
    unsigned int sum = 0;
    for (Asset *a in assets) {
        sum += [a resaleValue];
    }
    return sum;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<Employee %d: $%d in assets>",
            [self employeeId],[self valueOfAssets]];
}

- (void)dealloc {
    NSLog(@"deallocating %@", self);
}

@end
