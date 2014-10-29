//
//  MKCharacter.h
//  MortalKombat
//
//  Created by JR on 10/29/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKFighter.h"
#import "MKLiving.h"

@interface MKCharacter : NSObject <MKLiving, MKFighter>

// Creates a character with name.
+ (instancetype)characterWithName:(NSString *)name;

// Designated initializer.
- (instancetype)initWithName:(NSString *)name;

@property (nonatomic, copy) NSString *name;

@end
