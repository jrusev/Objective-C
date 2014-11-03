//
//  ShowPasswordViewController.h
//  PassKeeper
//
//  Created by JR on 11/3/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Password.h"

@interface ShowPasswordViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *accountLabel;
@property (strong, nonatomic) IBOutlet UITextField *encryptionCodeTextField;
@property (strong, nonatomic) IBOutlet UILabel *passwordLabel;
@property (weak, nonatomic) Password *password;

- (IBAction)retrievePasswordButtonPressed:(id)sender;

@end
