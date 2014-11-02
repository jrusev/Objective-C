//
//  MainViewController.h
//  PassKeeper
//
//  Created by JR on 11/2/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddPasswordViewController.h"

@interface MainViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, AddPasswordViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
