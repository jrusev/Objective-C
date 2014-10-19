//
//  Person.m
//  BMITime
//
//  Created by JR on 10/18/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize heightInMeters, weightInKilos;

- (float)bodyMassIndex
{
    float h = [self heightInMeters];
    return [self weightInKilos] / (h * h);
}

@end
