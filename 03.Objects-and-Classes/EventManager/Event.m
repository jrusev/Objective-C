//
//  EventManager
//  Created by JR on 10/26/14.
//

#import "Event.h"

@implementation Event

+ (instancetype)eventWithTitle:(NSString *)title
                     category:(NSString *)category
                         date:(NSDate *)date {
    
    return [[self alloc] initWithTitle:(NSString *)title
                               category:(NSString *)category
                                  date:(NSDate *)date];
}

// Must always override super's designated initializer.
- (instancetype)init {
    return [self initWithTitle:nil category:nil date:nil];
}

- (instancetype)initWithTitle:(NSString *)title
                     category:(NSString *)category
                         date:(NSDate *)date {
    self = [super init];
    if (self) {
        _title = [title copy];
        _category = [category copy];
        _date = [date copy];
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@, [%@], %@", self.title, self.category, self.date];
}

@end
