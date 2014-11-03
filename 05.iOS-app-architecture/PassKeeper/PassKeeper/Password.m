//
//  Password.m
//  PassKeeper
//
//  Created by JR on 11/3/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import "Password.h"

@implementation Password

- (instancetype)init {
    return [self initForAccount:nil withEncodedPassword:nil];
}

- (instancetype)initForAccount:(NSString *)account
           withEncodedPassword:(NSData *)encodedPassword {
    self = [super init];
    if (self) {
        _account = account;
        _encodedPassword = encodedPassword;
    }
    return self;    
}

-(NSString *)description {
    return [NSString stringWithFormat:@"%@ (password:%@)", self.account, self.encodedPassword];
}

@end
