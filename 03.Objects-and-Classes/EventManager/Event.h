//
//  EventManager
//  Created by JR on 10/26/14.
//

#import <Foundation/Foundation.h>

// Event class that represents a social event
@interface Event : NSObject

// Creates an event with title, category and date.
+ (instancetype)EventWithTitle:(NSString *)title
                     category:(NSString *)category
                         date:(NSDate *)date;

// Designated initializer.
- (instancetype)initWithTitle:(NSString *)title
                     category:(NSString *)category
                         date:(NSDate *)date;

@property NSString *title, *category, *info;
@property NSDate *date;
@property NSMutableArray *guests;

@end
