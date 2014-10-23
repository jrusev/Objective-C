//
//  main.m
//  Constants
//
//  Created by JR on 10/20/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Blender.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"\u03c0 is %f", M_PI);
        NSLog(@"%d is larger", MAX(10, 12));
        
        NSLocale *here = [NSLocale currentLocale];
        NSString *currency = [here objectForKey:NSLocaleCurrencyCode];
        NSLog(@"Money is %@", currency);
        
        // Using enums
        Blender *b = [[Blender alloc] init];
        b.speed = BlenderSpeedChop;
    }
    return 0;
}
