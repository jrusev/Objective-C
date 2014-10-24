//
//  OwnedAppliance.m
//  Applicances
//
//  Created by JR on 10/24/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import "OwnedAppliance.h"

@implementation OwnedAppliance

- (id)initWithProductName:(NSString *)prodName {
    return [self initWithProductName:prodName firstOwnerName:nil];
}

- (id)initWithProductName:(NSString *)prodName
           firstOwnerName:(NSString *)ownerName {
    
    self = [super initWithProductName:prodName];
    if (self) {
        ownerNames = [[NSMutableSet alloc] init];
        if (ownerName) {
            [ownerNames addObject:ownerName];
        }
    }
    return self;
}
- (void)addOwnerName:(NSString *)name {
    [ownerNames addObject:name];
}
- (void)removeOwnerName:(NSString *)name {
    [ownerNames removeObject:name];
}

@end
