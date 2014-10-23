//
//  TodoManger.h
//  TodoManagerConsole
//

#import <Foundation/Foundation.h>
@class Todo;

@interface TodoManger : NSObject

- (void)addTodo:(Todo *)todo;
- (NSArray *)todosAll;

@end
