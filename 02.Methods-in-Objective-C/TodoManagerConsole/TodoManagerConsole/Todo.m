//
//  Todo.m
//  TodoManagerConsole
//

#import "Todo.h"

@implementation Todo

+ (id)initWithTitle:(NSString *)title
            andDate:(NSDate *)date {
    Todo *t = [[Todo alloc] init];
    t.title = title;
    t.date = date;
    return t;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Todo: %@, date: %@", self.title, self.date];
}

@end
