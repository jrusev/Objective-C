#import <Foundation/Foundation.h>

@interface Logger : NSObject {
    NSMutableData *incomingData;
}

- (void)sayOuch:(NSTimer *)t;
- (void)zoneChange:(NSNotification *)note;

@end
