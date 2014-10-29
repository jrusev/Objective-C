//
//  MKCyborg.m
//  MortalKombat
//
//  Created by JR on 10/29/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import "MKCyborg.h"
#import "MKCharacter.h"

@implementation MKCyborg

- (void)cyborgPunch:(MKCharacter *)opponent {
    NSLog(@"%@ cyborg-punched %@.", self.name, opponent.name);
}

@end
