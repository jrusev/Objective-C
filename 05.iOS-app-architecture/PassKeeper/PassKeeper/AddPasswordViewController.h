//
//  AddPasswordViewController.h
//  PassKeeper
//
//  Created by JR on 11/2/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Password.h"

@protocol AddPasswordViewControllerDelegate <NSObject>

- (void)addPassword:(Password *)password;
- (void)didCancel;

@end

@interface AddPasswordViewController : UIViewController

@property (weak, nonatomic) id<AddPasswordViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UITextField *accountTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;


- (IBAction)addButtonPressed:(id)sender;
- (IBAction)canelButtonPressed:(id)sender;

@end
