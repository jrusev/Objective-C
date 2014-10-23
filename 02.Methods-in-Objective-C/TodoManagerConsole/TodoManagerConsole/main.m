//
//  main.m
//  TodoManagerConsole
//

#import <Foundation/Foundation.h>
#import "Todo.h"
#import "TodoManger.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        TodoManger *todoManager = [[TodoManger alloc] init];
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc]
                                       initWithDateFormat:@"%b %d %Y"
                                       allowNaturalLanguage:NO];
        
        Todo *todoHomework = [Todo initWithTitle:@"homework obj-c"
                                         andDate:[dateFormat dateFromString:@"Oct 26 2014"]];
        Todo *todoExam = [Todo initWithTitle:@"exam iOS"
                                         andDate:[dateFormat dateFromString:@"Nov 7 2014"]];
        
        [todoManager addTodo:todoHomework];
        [todoManager addTodo:todoExam];
        
        NSLog(@"%@", [todoManager todosAll]);
        
    }
    return 0;
}
