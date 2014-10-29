//
//  MKCryomancer.m
//  MortalKombat
//
//  Created by JR on 10/29/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import "MKCryomancer.h"
#import "MKCharacter.h"

@implementation MKCryomancer

- (void)freeze:(MKCharacter *)opponent {
    NSLog(@"%@ froze %@.", self.name, opponent.name);
}

@end
