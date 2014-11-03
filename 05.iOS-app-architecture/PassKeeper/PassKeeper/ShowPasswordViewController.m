//
//  ShowPasswordViewController.m
//  PassKeeper
//
//  Created by JR on 11/3/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import "ShowPasswordViewController.h"
#import "NSData+AES.h"

@implementation ShowPasswordViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    self.passwordLabel.text = @"";
    self.accountLabel.text = [NSString stringWithFormat:@"Account: %@", self.password.account];
}

- (IBAction)retrievePasswordButtonPressed:(id)sender {
    
    NSString *key = self.encryptionCodeTextField.text;
    
    if (key.length == 0) {
        return;
    }
    
    NSData *en_data = self.password.encodedPassword;
    NSData *de_data = [en_data AES128DecryptedDataWithKey:key];
    NSString *de_str = [[NSString alloc] initWithData:de_data
                                            encoding:NSUTF8StringEncoding];   
    
    if (de_str.length == 0) {
        [self showErrorWithMessage:@"Invalid encryption key!"];
        return;
    }
    self.passwordLabel.text = [NSString stringWithFormat:@"Password: %@", de_str];
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
