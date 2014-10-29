//
//  MKEnforcer.m
//  MortalKombat
//
//  Created by JR on 10/29/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import "MKEnforcer.h"
#import "MKCharacter.h"

@implementation MKEnforcer

- (void)enforce:(MKCharacter *)opponent {
    NSLog(@"%@ cenforced %@.", self.name, opponent.name);
}

@end
