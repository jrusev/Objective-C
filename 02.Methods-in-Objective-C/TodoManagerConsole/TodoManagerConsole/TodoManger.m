//
//  TodoManger.m
//  TodoManagerConsole
//

#import "TodoManger.h"

@implementation TodoManger {
    NSMutableArray *_todos;
}

- (id)init {
    self = [super init];
    if (self) {
        _todos = [NSMutableArray array];
    }
    return self;
}

- (void)addTodo:(Todo *)todo {
    [_todos addObject:todo];
}

- (NSArray *)todosAll {
    return _todos;
}

@end
