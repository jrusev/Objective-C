//
//  main.m
//  DateList
//
//  Created by JR on 10/17/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDate *now = [NSDate date];
        NSDate * tomorrow = [now dateByAddingTimeInterval:24.0 * 60.0 * 60.0];
        NSDate * yesterday = [now dateByAddingTimeInterval:-24.0 * 60.0 * 60.0];
        
        NSArray *dateArr = [NSArray arrayWithObjects:now, tomorrow, yesterday, nil];
        NSUInteger dateCount = [dateArr count];
        
        for (int i = 0; i < dateCount; i++) {
            NSLog(@"Date %d: %@", i, [dateArr objectAtIndex:i]);
        }
        
        NSMutableArray *dateList = [NSMutableArray array];
        [dateList addObject:now];
        [dateList addObject:tomorrow];
        [dateList insertObject:yesterday atIndex:0];
        
        for (NSDate *d in dateList) {
            NSLog(@"Date: %@", d);
        }
        
        [dateList removeObject:tomorrow];
        [dateList removeObjectAtIndex:0];
        
        NSLog(@"There are %lu date(s) in the list.", [dateList count]);
    }
    return 0;
}
