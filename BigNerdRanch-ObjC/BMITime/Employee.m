//
//  Employee.m
//  BMITime
//
//  Created by JR on 10/19/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import "Employee.h"

@implementation Employee

@synthesize employeeId;

-(float)bodyMassIndex
{
    return [super bodyMassIndex] * 0.90;
}

@end
