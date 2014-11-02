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
    return [self initWithHashedPassword:nil andSalt:nil forAccount:nil];
}

- (instancetype)initWithHashedPassword:(NSString *)hashedPassword
                               andSalt:(NSString *)salt
                            forAccount:(NSString *)account {
    self = [super init];
    if (self) {
        _hashedPassword = hashedPassword;
        _salt = salt;
        _account = account;
    }
    return self;
}

-(NSString *)description {
    return [NSString stringWithFormat:@"%@ (password:%@)", self.account, self.hashedPassword];
}

@end
