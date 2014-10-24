#import <UIKit/UIKit.h>

//---- @interface section ----

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITableViewDataSource> {
    UITableView *taskTable;
    UITextField *taskField;
    UIButton *insertButton;
    
    NSMutableArray *tasks;
}

- (void)addTask:(id)sender;

@property (strong, nonatomic) UIWindow *window;

@end

//---- @implementation section ----

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    tasks = [[NSMutableArray alloc] init];
    [tasks addObjectsFromArray:@[@"Walk the dogs", @"Feed the dogs", @"Chop the logs"]];
 
    taskTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 80, 320, 380)
                                             style:UITableViewStylePlain];
    [taskTable setDataSource:self];
    
    taskField = [[UITextField alloc] initWithFrame:CGRectMake(20, 40, 200, 31)];
    [taskField setBorderStyle:UITextBorderStyleRoundedRect];
    [taskField setPlaceholder:@"Type a task, tap Insert"];
    
    insertButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [insertButton setFrame:CGRectMake(228, 40, 72, 31)];
    [insertButton setTitle:@"Insert" forState:UIControlStateNormal];
    [insertButton addTarget:self
                     action:@selector(addTask:)
           forControlEvents:UIControlEventTouchUpInside];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window addSubview:taskTable];
    [self.window addSubview:taskField];
    [self.window addSubview:insertButton];
    
    [self.window setBackgroundColor:[UIColor whiteColor]];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)addTask:(id)sender {
    NSString *newItem = taskField.text;
    if ([newItem isEqualToString:@""]) {
        return;
    }
    
    [tasks addObject:newItem];
    [taskTable reloadData];
    taskField.text = @"";
    [taskField resignFirstResponder];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return tasks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [taskTable dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"Cell"];
    }
    
    NSString *item = tasks[indexPath.row];
    [cell.textLabel setText:item];
    
    return cell;
}

@end

//---- program section ----

int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
