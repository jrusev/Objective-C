//
//  MainViewController.m
//  PassKeeper
//
//  Created by JR on 11/2/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import "MainViewController.h"
#import "AddPasswordViewController.h"

@interface MainViewController()

@property (nonatomic, strong) NSMutableArray *passwords;

@end

@implementation MainViewController

-(void)viewDidLoad {
    self.passwords = [NSMutableArray array];
    [self.passwords addObject:[[Password alloc] initWithHashedPassword:@"pass1" andSalt:@"salt" forAccount:@"Google"]];
    [self.passwords addObject:[[Password alloc] initWithHashedPassword:@"pass2" andSalt:@"salt" forAccount:@"Facebook"]];
    self.tableView.dataSource = self;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[AddPasswordViewController class]]) {
        AddPasswordViewController *nextController = segue.destinationViewController;
        nextController.delegate = self;
    }
}

#pragma mark - UITableView DataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.passwords.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    Password *pass = self.passwords[indexPath.row];
    cell.textLabel.text = pass.account;
    return cell;
}

#pragma mark - AddPasswordViewController delegate

- (void)addPassword:(Password *)password {
    [self.passwords addObject:password];
    [self.tableView reloadData];
    [self dismissViewControllerAnimated:YES completion:nil];
    //[self.navigationController popViewControllerAnimated:YES];
    NSLog(@"%@", self.passwords);
}

- (void)didCancel {
    [self dismissViewControllerAnimated:YES completion:nil];
    //[self.navigationController popViewControllerAnimated:YES];
}

@end
