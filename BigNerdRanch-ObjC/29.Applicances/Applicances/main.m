//
//  main.m
//  Applicances
//
//  Created by JR on 10/24/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Appliance.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Appliance *a = [[Appliance alloc] init];
        NSLog(@"%@", a);
        
        a.productName = @"Washing machine";
        a.voltage = 240;
        NSLog(@"%@", a);
    }
    return 0;
}
