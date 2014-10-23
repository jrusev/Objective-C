//
//  main.m
//  BMITime
//
//  Created by JR on 10/18/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Employee.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Employee *emp = [[Employee alloc] init];
        
        [emp setWeightInKilos:85];
        [emp setHeightInMeters:1.8];
        [emp setEmployeeId:15];
        
        float bmi = [emp bodyMassIndex];
        NSLog(@"Employee #%d has BMI of %.2f", [emp employeeId],bmi);
    }
    return 0;
}
