//
//  MKCharacter.m
//  MortalKombat
//
//  Created by JR on 10/29/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import "MKCharacter.h"

@implementation MKCharacter

@synthesize power, life;

+ (instancetype)characterWithName:(NSString *)name {
    return [[self alloc] initWithName:(NSString *)name];
}

// Must always override super's designated initializer.
- (instancetype)init {
    return [self initWithName:@"Unknown"];
}

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        _name = [name copy];
    }
    return self;
}

- (void)punch:(MKCharacter *)opponent {
    NSLog(@"Punch!");
    self.power++;
    opponent.life--;
}

- (void)kick:(MKCharacter *)opponent {
    NSLog(@"Kick!");
    self.power++;
    opponent.life--;
}

- (BOOL)isAlive {
    return self.life > 0;
}

@end
