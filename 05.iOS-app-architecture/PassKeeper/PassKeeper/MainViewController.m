//
//  MainViewController.m
//  PassKeeper
//
//  Created by JR on 11/2/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import "MainViewController.h"
#import "AddPasswordViewController.h"
#import "ShowPasswordViewController.h"
#import "NSData+AES.h"

@interface MainViewController()

@property (nonatomic, strong) NSMutableArray *passwords;

@end

@implementation MainViewController

-(void)viewDidLoad {
    self.passwords = [NSMutableArray array];
    
    NSData *en_data1 = [self encryptString:@"pass1" withKey:@"Google"];
    NSData *en_data2 = [self encryptString:@"pass2" withKey:@"Facebook"];
    
    Password *pass1 = [[Password alloc] initForAccount:@"Google" withEncodedPassword:en_data1];
    Password *pass2 = [[Password alloc] initForAccount:@"Facebook" withEncodedPassword:en_data2];
    
    [self.passwords addObject:pass1];
    [self.passwords addObject:pass2];
    
    self.tableView.dataSource = self;
}

- (NSData *)encryptString:(NSString *)str withKey:(NSString *)key {
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSData *encoded = [data AES128EncryptedDataWithKey:key];
    return encoded;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[AddPasswordViewController class]]) {
        AddPasswordViewController *nextController = segue.destinationViewController;
        nextController.delegate = self;
    }
    
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        if ([segue.destinationViewController isKindOfClass:[ShowPasswordViewController class]]) {
            NSIndexPath *path = [self.tableView indexPathForCell:sender];
            Password *password = self.passwords[path.row];
            
            ShowPasswordViewController *nextController = segue.destinationViewController;
            nextController.password = password;
        }
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
}

- (void)didCancel {
    [self dismissViewControllerAnimated:YES completion:nil];
    //[self.navigationController popViewControllerAnimated:YES];
}

@end
