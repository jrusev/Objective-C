//
//  EventManager
//  Created by JR on 10/26/14.
//

#import <Foundation/Foundation.h>

// Event class that represents a social event
@interface Event : NSObject

// Creates an event with title, category and date.
+ (instancetype)eventWithTitle:(NSString *)title
                     category:(NSString *)category
                         date:(NSDate *)date;

// Designated initializer.
- (instancetype)initWithTitle:(NSString *)title
                     category:(NSString *)category
                         date:(NSDate *)date;

@property (nonatomic, copy) NSString *title, *category, *info;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSMutableArray *guests;

@end
