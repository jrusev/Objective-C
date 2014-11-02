//
//  AddPasswordViewController.m
//  PassKeeper
//
//  Created by JR on 11/2/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import "AddPasswordViewController.h"

@implementation AddPasswordViewController

- (IBAction)addButtonPressed:(id)sender {
    NSString *realPassword = self.passwordTextField.text;
    NSString *account = self.accountTextField.text;
    Password *pass = [[Password alloc] initWithHashedPassword:realPassword andSalt:@"salt" forAccount:account];
    [self.delegate addPassword:pass];
}

- (IBAction)canelButtonPressed:(id)sender {
    [self.delegate didCancel];
}

@end
