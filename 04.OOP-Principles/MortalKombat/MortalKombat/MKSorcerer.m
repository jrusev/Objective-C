//
//  MKSorcerer.m
//  MortalKombat
//
//  Created by JR on 10/29/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import "MKSorcerer.h"
#import "MKCharacter.h"

@implementation MKSorcerer

- (void)castSpell:(MKCharacter *)opponent {
    NSLog(@"%@ cast spell on %@.", self.name, opponent.name);
}

@end
