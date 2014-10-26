//
//  EventManager
//  Created by JR on 10/26/14.
//

#import <Foundation/Foundation.h>
#import "Event.h"
#import "EventManager.h"

NSArray* createEvents() {
    NSTimeInterval day = 24 * 3600;
    return @[
        [Event EventWithTitle:@"lady's night" category:@"parties" date:[NSDate dateWithTimeIntervalSinceNow:3*day]],
        [Event EventWithTitle:@"beer" category:@"social events" date:[NSDate dateWithTimeIntervalSinceNow:2*day]],
        [Event EventWithTitle:@"pizza" category:@"food" date:[NSDate dateWithTimeIntervalSinceNow:day]]
        ];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        EventManager *evManager = [[EventManager alloc] init];
        [evManager addEventsFromArray:createEvents()];
        
        NSLog(@"all events: %@", [evManager eventsAll]);
        NSLog(@"sorted by title: %@", [evManager eventsSortByTitle]);
        NSLog(@"sorted by date: %@", [evManager eventsSortByDate]);
        NSLog(@"social events: %@", [evManager eventsByCategory:@"social events"]);
    }
    return 0;
}


