//
//  EventManager
//  Created by JR on 10/26/14.
//

#import "EventManager.h"

@interface EventManager()
// Declare "private" methods as class extension
- (NSArray *)eventsSortByProperty:(NSString *)p;
@end

@implementation EventManager {
    NSMutableArray *_events;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _events = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addEvent:(Event *)event {
    if ([event isEqual:[NSNull null]]) {
        NSLog(@"Event cannot be null!");
    }
    
    [_events addObject:event];
}

- (void)addEventsFromArray:(NSArray *)events {
    [_events addObjectsFromArray:events];
}

- (NSArray *)eventsAll {
    return [_events copy];
}

- (NSArray *)eventsSortByDate {
    return [self eventsSortByProperty:@"date"];
}

- (NSArray *)eventsSortByTitle {
    return [self eventsSortByProperty:@"title"];
}

- (NSArray *)eventsByCategory:(NSString *)category {
    NSPredicate *byCategory = [NSPredicate predicateWithFormat:@"category = %@", category];
    return [_events filteredArrayUsingPredicate:byCategory];
}

- (NSArray *)eventsSortByProperty:(NSString *)p {
    NSSortDescriptor *descr = [NSSortDescriptor sortDescriptorWithKey:p ascending:YES];
    return [_events sortedArrayUsingDescriptors:@[descr]];
}

@end
