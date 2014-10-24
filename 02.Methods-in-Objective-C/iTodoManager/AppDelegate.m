#import "AppDelegate.h"

NSString *docPath() {
    NSArray *pathList = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    return [pathList[0] stringByAppendingPathComponent:@"data.td"];
}

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Attempt to loading existing to-do dataset from an array stored to disk.
    NSArray *plist = [NSArray arrayWithContentsOfFile:docPath()];
    if (plist) {
        // If there was a dataset available, copy it into our instance variable.
        tasks = [plist mutableCopy];
    } else {
        // Otherwise, just create an empty one to get started.
        tasks = [[NSMutableArray alloc] init];
    }
    
    // Is tasks empty?
    if ([tasks count] == 0) {
        // Put some strings in it
        [tasks addObject:@"Walk the dogs"];
        [tasks addObject:@"Feed the dogs"];
        [tasks addObject:@"Chop the logs"];
    }
    
    // Create and configure the UIWindow instance.
    CGRect windowFrame = [[UIScreen mainScreen] bounds];
    UIWindow *theWindow = [[UIWindow alloc] initWithFrame:windowFrame];
    [self setWindow:theWindow];
    
    // Define the frame rectangles of the three UI elements.
    CGRect tableFrame = CGRectMake(0, 80, 320, 380);
    CGRect fieldFrame = CGRectMake(20, 40, 200, 31);
    CGRect buttonFrame = CGRectMake(228, 40, 72, 31);
    
    // Create and configure the table view
    taskTable = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
    [taskTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    // Make this object the table view's dataSource
    [taskTable setDataSource:self];
    
    // Create and configure the text field where new tasks will be typed
    taskField = [[UITextField alloc] initWithFrame:fieldFrame];
    [taskField setBorderStyle:UITextBorderStyleRoundedRect];
    [taskField setPlaceholder:@"Type a task, tap insert"];
    
    // Create and configure a rounded rect Insert button
    insertButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [insertButton setFrame:buttonFrame];
    [insertButton setTitle:@"Insert" forState:UIControlStateNormal];
    
    // Configure the insert button's action to call this object's addTask: method
    [insertButton addTarget:self
                     action:@selector(addTask:)
           forControlEvents:UIControlEventTouchUpInside];
    
    // Add the three UI elements to the window
    [[self window] addSubview:taskTable];
    [[self window] addSubview:taskField];
    [[self window] addSubview:insertButton];
    
    // Finalize the window and put it on the screen
    [[self window] setBackgroundColor:[UIColor whiteColor]];
    [[self window] makeKeyAndVisible];
    
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
    NSString *newItem = [taskField text];
    if ([newItem isEqualToString:@""]) {
        return;
    }
    
    [tasks addObject:newItem];
    [taskTable reloadData];
    [taskField setText:@""];
    
    // Resign first responder status to hide the keyboard
    [taskField resignFirstResponder];
}

#pragma mark - Table View management

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // The number of rows is equal to the number of items in the tasks array
    return [tasks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Check if there's a cell avaible to reuse (a cell that has scrolled off screen)
    UITableViewCell *cell = [taskTable dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        // ...and only create a new cell if none are abaible
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                   reuseIdentifier:@"Cell"];
    }
    
    // Then (re)configure the cell based on the model
    NSString *item = tasks[[indexPath row]];
    [[cell textLabel] setText:item];
    
    return cell;
}

@end
