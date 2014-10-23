//
//  Todo.h
//  TodoManagerConsole
//

#import <Foundation/Foundation.h>

@interface Todo : NSObject

@property NSString *title;
@property NSDate *date;

+ (id)initWithTitle:(NSString *)title
            andDate:(NSDate *)date;

- (NSString *)description;

@end
