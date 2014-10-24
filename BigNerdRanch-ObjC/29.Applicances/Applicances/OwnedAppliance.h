//
//  OwnedAppliance.h
//  Applicances
//
//  Created by JR on 10/24/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Appliance.h"

@interface OwnedAppliance : Appliance {
    NSMutableSet *ownerNames;
}

// The designated initializer
- (id)initWithProductName:(NSString *)prodName
           firstOwnerName:(NSString *)ownerName;
- (void)addOwnerName:(NSString *)name;
- (void)removeOwnerName:(NSString *)name;

@end
