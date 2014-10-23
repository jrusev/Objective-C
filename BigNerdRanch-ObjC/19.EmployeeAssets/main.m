#import <Foundation/Foundation.h>
#import "Employee.h"
#import "Asset.h"

NSMutableArray* createEmployees() {
    NSMutableArray *employees = [[NSMutableArray alloc] init];
    
    for (int i =0; i < 10; i++) {
        Employee *emp = [[Employee alloc] init];
        
        [emp setEmployeeId:i];            
        [employees addObject:emp];
    }
    
    return employees;
}

NSMutableArray * createAssets() {
    
    NSMutableArray *assets = [[NSMutableArray alloc] init];
    for (int i = 0; i < 10; i++) {
        Asset *asset = [[Asset alloc] init];
        [asset setResaleValue:i*17];
        NSString *label = [NSString stringWithFormat:@"Laptop %d", i];
        [asset setLabel:label];
        
        [assets addObject:asset];
    }
    return assets;
}

NSMutableDictionary * addManagers(NSMutableArray *employees) {
    // Add CEO and CTO
    NSMutableDictionary *execs = [NSMutableDictionary dictionary];
    [execs setObject:employees[0] forKey:@"CEO"];
    [execs setObject:employees[1] forKey:@"CTO"];
    return execs;
}

void addAssetsToEmployees(NSMutableArray *employees, NSMutableArray *assets) {
    
    for (Asset *asset in assets) {
        NSUInteger randIndex = random() % [employees count];
        Employee *randEmployee = employees[randIndex];
        [randEmployee addAssetsObject:asset];
        asset.owner = randEmployee;
    }
}

void sortEmployeesByAssets(NSMutableArray *employees) {
    NSSortDescriptor *voa = [NSSortDescriptor sortDescriptorWithKey:@"valueOfAssets" ascending:YES];
    NSSortDescriptor *ei = [NSSortDescriptor sortDescriptorWithKey:@"employeeId" ascending:YES];
    [employees sortUsingDescriptors:[NSArray arrayWithObjects:voa, ei, nil]];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableArray *employees = createEmployees();
        NSMutableArray *assets = createAssets();
        
        NSMutableDictionary *execs = addManagers(employees);
        addAssetsToEmployees(employees, assets);
        
        sortEmployeesByAssets(employees);
        NSLog(@"Sorted employees by assets %@", employees);
        
        NSLog(@"Giving up ownership of employee %@", employees[5]);
        [employees removeObjectAtIndex:5];
        
        NSLog(@"assets: %@", assets);
        NSLog(@"execs %@", execs);
        execs = nil;
        
        // filter assets
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"owner.valueOfAssets > 70"];
        NSArray *filtered = [assets filteredArrayUsingPredicate:pred];
        NSLog(@"filtered assets: %@", filtered);
        filtered = nil;
        
        NSLog(@"Dealocating...");
        
        assets = nil;
        employees = nil;
        // The only object that will be deallocated is the asset without owner
        NSLog(@"autorelease...");
    }
    return 0;
}
