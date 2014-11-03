//
//  AddPasswordViewController.m
//  PassKeeper
//
//  Created by JR on 11/2/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import "AddPasswordViewController.h"
#import "NSData+AES.h"

@implementation AddPasswordViewController

- (IBAction)addButtonPressed:(id)sender {
    
    NSString *account = self.accountTextField.text;
    NSString *password = self.passwordTextField.text;
    NSString *key = self.encryptionKeyTextField.text;
    
    if (account.length == 0) {
        [self showErrorWithMessage:@"Account cannot be empty!"];
        return;
    }
    
    if (password.length == 0) {
        [self showErrorWithMessage:@"Password cannot be empty!"];
        return;
    }
    
    if (key.length == 0) {
        [self showErrorWithMessage:@"Key cannot be empty!"];
        return;
    }
    

    NSData *data = [password dataUsingEncoding:NSUTF8StringEncoding];
    NSData *en_data = [data AES128EncryptedDataWithKey:key];
    
    Password *pass = [[Password alloc] initForAccount:account withEncodedPassword:en_data];
    pass.encodedPassword = en_data;
    [self.delegate addPassword:pass];
}

- (IBAction)canelButtonPressed:(id)sender {
    [self.delegate didCancel];
}

- (void)showErrorWithMessage:(NSString *)message {
    
    UIAlertView *alert = [[UIAlertView alloc]
                          
                          initWithTitle:@"Error"
                          message:message
                          delegate:nil
                          cancelButtonTitle:@"Ok"
                          otherButtonTitles:nil];
    [alert show];
}

@end
