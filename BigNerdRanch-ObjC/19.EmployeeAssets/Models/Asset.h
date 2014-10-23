#import <Foundation/Foundation.h>
@class Employee;

@interface Asset : NSObject
{
    NSString *label;
    __weak Employee *owner;
    unsigned int resaleValue;
}

@property (strong) NSString *label;
@property (weak) Employee *owner;
@property unsigned int resaleValue;

@end
