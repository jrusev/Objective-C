#import <Foundation/Foundation.h>
@class Asset;

@interface Employee : NSObject
{
    int employeeId;
    NSMutableSet *assets;
}

@property int employeeId;
- (void)addAssetsObject:(Asset *)a;
- (unsigned int)valueOfAssets;

@end
