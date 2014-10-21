#import <Foundation/Foundation.h>

@interface Logger : NSObject {
    NSMutableData *incomingData;
}

- (void)sayOuch:(NSTimer *)t;

@end
