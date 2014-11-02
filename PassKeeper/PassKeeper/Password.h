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
@property (nonatomic, copy) NSString *hashedPassword;
@property (nonatomic, copy) NSString *salt;


// Designated initializer
- (instancetype)initWithHashedPassword:(NSString *)hashedPassword
                               andSalt:(NSString *)salt
                            forAccount:(NSString *)account;

@end
