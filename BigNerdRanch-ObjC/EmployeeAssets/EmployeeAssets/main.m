#import <Foundation/Foundation.h>
#import "Employee.h"
#import "Asset.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *employees = [[NSMutableArray alloc] init];
        
        for (int i =0; i < 10; i++) {
            Employee *emp = [[Employee alloc] init];
            
            [emp setEmployeeId:i];
            
            [employees addObject:emp];
        }
        
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
        }
        
        NSSortDescriptor *voa = [NSSortDescriptor sortDescriptorWithKey:@"valueOfAssets" ascending:YES];
        NSSortDescriptor *ei = [NSSortDescriptor sortDescriptorWithKey:@"employeeId" ascending:YES];
        [employees sortUsingDescriptors:[NSArray arrayWithObjects:voa, ei, nil]];
        
        NSLog(@"Employees %@", employees);
        
        NSLog(@"Giving up ownership of employee");
        [employees removeObjectAtIndex:5];
        
        NSLog(@"Giving up ownership of array");
        employees = nil;
    }
    return 0;
}
