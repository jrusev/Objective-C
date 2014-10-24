#import <UIKit/UIKit.h>

// Helper function to get a path to the location on disk
// where we can save the to-do list
NSString *docPath(void);

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITableViewDataSource> {
    UITableView *taskTable;
    UITextField *taskField;
    UIButton *insertButton;
    
    NSMutableArray *tasks;
}

- (void)addTask:(id)sender;

@property (strong, nonatomic) UIWindow *window;

@end
