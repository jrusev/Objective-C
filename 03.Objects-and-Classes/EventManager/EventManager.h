//
//  EventManager
//  Created by JR on 10/26/14.
//

#import <Foundation/Foundation.h>
#import "Event.h"

// Event manager class to handle social events
@interface EventManager : NSObject

- (void)addEvent:(Event *)event;
- (void)addEventsFromArray:(NSArray *)events;
- (NSArray *)eventsAll;
- (NSArray *)eventsSortByDate;
- (NSArray *)eventsSortByTitle;
- (NSArray *)eventsByCategory:(NSString *)category;

@end
