#import <Foundation/Foundation.h>
#import "Employee.h"
#import "Asset.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Create 10 employees
        NSMutableArray *employees = [[NSMutableArray alloc] init];
        
        // Create dictionary for executives
        NSMutableDictionary *execs = [[NSMutableDictionary alloc] init];
        for (int i =0; i < 10; i++) {
            Employee *emp = [[Employee alloc] init];
            
            [emp setEmployeeId:i];            
            [employees addObject:emp];
            
            if (i == 0) {
                [execs setObject:emp forKey@"CEO"];   
            } else if (i == 1) {
                [execs setObject:emp forKey:@"CTO"];   
            }
        }
        
        // Create 10 assets
        NSMutableArray *allAssets = [[NSMutableArray alloc] init];
        for (int i = 0; i < 10; i++) {
            // Create asset
            Asset *asset = [[Asset alloc] init];
            [asset setResaleValue:i*17];
            NSString *label = [NSString stringWithFormat:@"Laptop %d", i];
            [asset setLabel:label];
            
            // Add asset to random employee
            NSUInteger randIndex = random() % [employees count];
            Employee *randEmployee = [employees objectAtIndex:randIndex];
            [randEmployee addAssetsObject:asset];
            [allAssets addObject:asset];
        }
        
        NSSortDescriptor *voa = [NSSortDescriptor sortDescriptorWithKey:@"valueOfAssets" ascending:YES];
        NSSortDescriptor *ei = [NSSortDescriptor sortDescriptorWithKey:@"employeeId" ascending:YES];
        [employees sortUsingDescriptors:[NSArray arrayWithObjects:voa, ei, nil]];
        
        NSLog(@"Employees %@", employees);
        
        NSLog(@"Giving up ownership of employee");
        [employees removeObjectAtIndex:5];
        
        NSLog(@"allAssets: %@", allAssets);
        NSLog(@"execs %@", execs);
        execs = nil;
        
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"owner.valueOfAssets > 70"];
        NSArray *filtered = [allAssets filterArrayUsingPredicate:pred];
        NSLog(@"filtered: %@", filtered);
        filtered = nil;
        
        NSLog(@"Giving up ownership of array");
        
        allAssets = nil;
        employees = nil;
    }
    return 0;
}
