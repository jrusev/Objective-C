//
//  Appliance.m
//  Applicances
//
//  Created by JR on 10/24/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import "Appliance.h"

@implementation Appliance

- (instancetype)init {
    return [self initWithProductName:@"Unknown"];
}

- (instancetype)initWithProductName:(NSString *)prodName {
    self = [super init];
    if (self) {
        _productName = prodName;
        _voltage = 120;
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@: %d volts>", self.productName, self.voltage];
}

@end
