//
//  EventManager
//  Created by JR on 10/26/14.
//

#import <Foundation/Foundation.h>
#import "Event.h"
#import "EventManager.h"

NSArray* createEvents() {
    
    return @[
             [Event EventWithTitle:@"lady's night" category:@"parties" date:[NSDate date]],
             [Event EventWithTitle:@"beer" category:@"social events" date:[NSDate date]],
             [Event EventWithTitle:@"pizza" category:@"food" date:[NSDate date]]
             ];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        EventManager *evManager = [[EventManager alloc] init];
        [evManager addEventsFromArray:createEvents()];
        
        NSLog(@"all events: %@", [evManager eventsAll]);
        NSLog(@"sorted by title: %@", [evManager eventsSortByTitle]);
        NSLog(@"social events: %@", [evManager eventsByCategory:@"social events"]);
    }
    return 0;
}


