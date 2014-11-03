//
//  ShowPasswordViewController.m
//  PassKeeper
//
//  Created by JR on 11/3/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import "ShowPasswordViewController.h"

@implementation ShowPasswordViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    self.passwordLabel.text = @"";
}

- (IBAction)retrievePasswordButtonPressed:(id)sender {
    self.passwordLabel.text = [NSString stringWithFormat:@"Password: %@", self.password.hashedPassword];
}
@end
