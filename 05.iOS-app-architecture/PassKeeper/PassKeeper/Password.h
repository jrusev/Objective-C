//
//  Password.h
//  PassKeeper
//
//  Created by JR on 11/3/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Password : NSObject

@property (nonatomic, copy) NSString *account;
@property (nonatomic, strong) NSData *encodedPassword;


// Designated initializer
- (instancetype)initForAccount:(NSString *)account
           withEncodedPassword:(NSData *)encodedPassoword;

@end
