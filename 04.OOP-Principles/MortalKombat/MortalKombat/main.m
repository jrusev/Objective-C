//
//  main.m
//  MortalKombat
//
//  Created by JR on 10/29/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKCyborg.h"
#import "MKNinja.h"
#import "MKCryomancer.h"
#import "MKSorcerer.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MKNinja *ninja = [MKNinja characterWithName:@"Black Ninja"];
        MKCyborg *cyborg = [MKCyborg characterWithName:@"Robocop"];
        MKCryomancer *cryo = [MKCryomancer characterWithName:@"Cryo"];
        MKSorcerer *sorcerer = [MKSorcerer characterWithName:@"Saruman"];
        
        [ninja becomeInvisible];
        [cyborg cyborgPunch:cryo];
        [cryo freeze:cyborg];
        [sorcerer castSpell:ninja];
    }
    return 0;
}
