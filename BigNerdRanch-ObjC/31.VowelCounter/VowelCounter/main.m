//
//  main.m
//  VowelCounter
//
//  Created by JR on 10/25/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+VowelCounting.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        NSString *str = @"Hello, World!";
        NSLog(@"'%@' has %d vowels", str, [str vowelCount]);
    }
    return 0;
}
