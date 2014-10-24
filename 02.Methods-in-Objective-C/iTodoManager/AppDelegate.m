#import "AppDelegate.h"

NSString *docPath() {
    NSArray *pathList = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    return [pathList[0] stringByAppendingPathComponent:@"data.td"];
}

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Attempt to loading existing todo dataset from an array stored to disk.
    NSArray *plist = [NSArray arrayWithContentsOfFile:docPath()];
    if (plist) {
        // If there was a dataset available, copy it into our instance variable.
        tasks = [plist mutableCopy];
    } else {
        // Otherwise, just create an empty one to get started.
        tasks = [[NSMutableArray alloc] init];
    }
    
    // If tasks is empty put sample data
    if ([tasks count] == 0) {
        [tasks addObjectsFromArray:@[@"Walk the dogs", @"Feed the dogs", @"Chop the logs"]];
    }
 
    // Create and configure the table view
    taskTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 80, 320, 380)
                                             style:UITableViewStylePlain];
    [taskTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [taskTable setDataSource:self];
    
    // Create and configure the text field where new tasks will be typed
    taskField = [[UITextField alloc] initWithFrame:CGRectMake(20, 40, 200, 31)];
    [taskField setBorderStyle:UITextBorderStyleRoundedRect];
    [taskField setPlaceholder:@"Type a task, tap Insert"];
    
    // Create and configure the insert button
    insertButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [insertButton setFrame:CGRectMake(228, 40, 72, 31)];
    [insertButton setTitle:@"Insert" forState:UIControlStateNormal];
    
    // Configure the insert button's action to call this object's addTask: method
    [insertButton addTarget:self
                     action:@selector(addTask:)
           forControlEvents:UIControlEventTouchUpInside];
    
    // Create and configure the UIWindow instance.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Add the three UI elements to the window
    [self.window addSubview:taskTable];
    [self.window addSubview:taskField];
    [self.window addSubview:insertButton];
    
    // Finalize the window and put it on the screen
    [self.window setBackgroundColor:[UIColor whiteColor]];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Save the tasks to disk
    [tasks writeToFile:docPath() atomically:YES];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Save the tasks to disk
    [tasks writeToFile:docPath() atomically:YES];
}

- (void)addTask:(id)sender {
    NSString *newItem = taskField.text;
    if ([newItem isEqualToString:@""]) {
        return;
    }
    
    [tasks addObject:newItem];
    [taskTable reloadData];
    taskField.text = @"";
    
    // Resign first responder status to hide the keyboard
    [taskField resignFirstResponder];
}

#pragma mark - Table View management

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // The number of rows is equal to the number of items in the tasks array
    return tasks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Check if there's a cell available to reuse (a cell that has scrolled off screen)
    UITableViewCell *cell = [taskTable dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        // ...and only create a new cell if none are available
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"Cell"];
    }
    
    // Then (re)configure the cell based on the model
    NSString *item = tasks[indexPath.row];
    [cell.textLabel setText:item];
    
    return cell;
}

@end
