//
//  MKFighter.h
//  MortalKombat
//
//  Created by JR on 10/29/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

@protocol MKFighter

- (void)punch:(id)opponent;
- (void)kick:(id)opponent;

@property int power;

@end
