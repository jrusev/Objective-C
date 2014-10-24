#import <UIKit/UIKit.h>

// Helper function to get the path on disk where we can save the todo list
NSString *docPath(void);

// A delegate for NSApplication to handle notifications about app launch and shutdown.
// Owned by the main app controller.
@interface AppDelegate : UIResponder <UIApplicationDelegate, UITableViewDataSource> {
    UITableView *taskTable;
    UITextField *taskField;
    UIButton *insertButton;
    
    NSMutableArray *tasks;
}

// Add task to the task list
- (void)addTask:(id)sender;

@property (strong, nonatomic) UIWindow *window;

@end
